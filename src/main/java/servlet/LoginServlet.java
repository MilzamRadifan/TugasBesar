package servlet;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import model.User;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    
    // Gunakan algoritma hashing yang lebih kuat (MD5 sudah tidak aman)
    private String hashPassword(String password) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        md.update(password.getBytes());
        byte[] digest = md.digest();
        StringBuilder sb = new StringBuilder();
        for (byte b : digest) {
            sb.append(String.format("%02x", b & 0xff));
        }
        return sb.toString();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password");

        // Validasi input
        if(username.isEmpty() || password.isEmpty()) {
            request.setAttribute("error", "Email/nomor telepon dan password harus diisi");
            request.getRequestDispatcher("RegisterPage.jsp").forward(request, response);
            return;
        }

        try (Connection conn = DatabaseConnection.getConnection()) {
            // Query yang lebih aman dengan parameterized statement
            String sql = "SELECT id, name, email, phone, password FROM users WHERE email = ? OR phone = ?";
            
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, username.toLowerCase());
                stmt.setString(2, username);
                
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        String storedPassword = rs.getString("password");
                        String hashedInput = hashPassword(password);

                        // Debugging info
                        System.out.println("Login attempt by: " + username);
                        System.out.println("Stored hash: " + storedPassword.substring(0, 10) + "...");
                        System.out.println("Input hash: " + hashedInput.substring(0, 10) + "...");

                        if (storedPassword.equals(hashedInput)) {
                            // Login berhasil
                            User user = new User();
                            user.setId(rs.getInt("id"));
                            user.setName(rs.getString("name"));
                            user.setEmail(rs.getString("email"));
                            user.setPhone(rs.getString("phone"));

                            HttpSession session = request.getSession();
                            session.setAttribute("user", user);
                            session.setMaxInactiveInterval(30 * 60); // Session 30 menit

                            // Redirect setelah login sukses
                            response.sendRedirect("Beranda.jsp");
                            return;
                        }
                    }
                    
                    // Login gagal - jangan beri tahu yang spesifik ke user
                    request.setAttribute("error", "Email/nomor telepon atau password tidak valid");
                }
            }
        } catch (NoSuchAlgorithmException e) {
            log("Hashing error", e);
            request.setAttribute("error", "Terjadi kesalahan sistem");
        } catch (SQLException e) {
            log("Database error", e);
            request.setAttribute("error", "Terjadi kesalahan sistem");
        } catch (Exception e) {
            log("Unexpected error", e);
            request.setAttribute("error", "Terjadi kesalahan sistem");
        }
        
        // Kembali ke halaman login dengan pesan error
        request.getRequestDispatcher("RegisterPage.jsp").forward(request, response);
    }
}