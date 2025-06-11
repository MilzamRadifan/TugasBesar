package servlet;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import model.User;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    private String hashPassword(String password) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        md.update(password.getBytes());
        byte[] byteData = md.digest();
        
        StringBuilder sb = new StringBuilder();
        for (byte b : byteData) {
            sb.append(String.format("%02x", b));
        }
        return sb.toString();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get and trim parameters
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");

        // Validasi input
        if (name == null || email == null || phone == null || password == null ||
                name.trim().isEmpty() || email.trim().isEmpty() || 
                phone.trim().isEmpty() || password.trim().isEmpty()) {
            request.setAttribute("error", "Semua field harus diisi");
            request.getRequestDispatcher("RegisterPage.jsp").forward(request, response);
            return;
        }

        if (!email.matches("^[\\w-_.+]*[\\w-_.]@([\\w]+\\.)+[\\w]+[\\w]$")) {
            request.setAttribute("error", "Format email tidak valid");
            request.getRequestDispatcher("RegisterPage.jsp").forward(request, response);
            return;
        }

        if (!phone.matches("^[0-9]{10,13}$")) {
            request.setAttribute("error", "Nomor telepon harus 10-13 digit angka");
            request.getRequestDispatcher("RegisterPage.jsp").forward(request, response);
            return;
        }

        if (password.length() < 8) {
            request.setAttribute("error", "Password harus minimal 8 karakter");
            request.getRequestDispatcher("RegisterPage.jsp").forward(request, response);
            return;
        }

        try (Connection conn = DatabaseConnection.getConnection()) {
            // Cek email/phone sudah terdaftar
            String checkQuery = "SELECT * FROM users WHERE email = ? OR phone = ?";
            try (PreparedStatement checkStmt = conn.prepareStatement(checkQuery)) {
                checkStmt.setString(1, email.trim().toLowerCase());
                checkStmt.setString(2, phone.trim());
                
                try (ResultSet rs = checkStmt.executeQuery()) {
                    if (rs.next()) {
                        request.setAttribute("error", "Email atau nomor telepon sudah terdaftar");
                        request.getRequestDispatcher("RegisterPage.jsp").forward(request, response);
                        return;
                    }
                }
            }

            // Hash password
            String hashedPassword = hashPassword(password);

            // Insert user dengan transaction
            conn.setAutoCommit(false);
            
            try {
                String insertQuery = "INSERT INTO users (name, email, phone, password) VALUES (?, ?, ?, ?)";
                try (PreparedStatement insertStmt = conn.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS)) {
                    insertStmt.setString(1, name.trim());
                    insertStmt.setString(2, email.trim().toLowerCase());
                    insertStmt.setString(3, phone.trim());
                    insertStmt.setString(4, hashedPassword);

                    int affectedRows = insertStmt.executeUpdate();
                    
                    if (affectedRows == 0) {
                        conn.rollback();
                        throw new SQLException("Gagal membuat user, tidak ada rows yang terpengaruh");
                    }

                    try (ResultSet generatedKeys = insertStmt.getGeneratedKeys()) {
                        if (generatedKeys.next()) {
                            // Buat user object
                            User user = new User();
                            user.setId(generatedKeys.getInt(1));
                            user.setName(name.trim());
                            user.setEmail(email.trim().toLowerCase());
                            user.setPhone(phone.trim());

                            // Set session
                            HttpSession session = request.getSession();
                            session.setAttribute("user", user);
                            session.setMaxInactiveInterval(30 * 60); // 30 menit

                            // Debugging
                            System.out.println("User created: " + user.toString());
                            System.out.println("Session ID: " + session.getId());
                            System.out.println("User in session: " + session.getAttribute("user"));

                            // Commit transaction
                            conn.commit();

                            // Gunakan forward untuk mempertahankan session
                            request.setAttribute("success", "Registrasi berhasil!");
                            request.getRequestDispatcher("Beranda.jsp").forward(request, response);
                            return;
                        } else {
                            conn.rollback();
                            throw new SQLException("Gagal mendapatkan ID user setelah insert");
                        }
                    }
                }
            } catch (SQLException e) {
                conn.rollback();
                throw e;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Terjadi kesalahan database. Silakan coba lagi.");
            request.getRequestDispatcher("RegisterPage.jsp").forward(request, response);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            request.setAttribute("error", "Error sistem: Gagal mengenkripsi password");
            request.getRequestDispatcher("RegisterPage.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Terjadi kesalahan sistem: " + e.getMessage());
            request.getRequestDispatcher("RegisterPage.jsp").forward(request, response);
        }
    }
}