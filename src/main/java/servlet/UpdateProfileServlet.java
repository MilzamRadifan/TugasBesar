package servlet;

import model.User;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        // Ambil data dari form, dan handle jika null
        String fullName = getSafeParam(request, "fullname");
        String username = getSafeParam(request, "username");
        String email = getSafeParam(request, "email").toLowerCase();
        String phone = getSafeParam(request, "phone");
        String bio = getSafeParam(request, "bio");
        String website = getSafeParam(request, "website");

        // Ambil user dari session
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("LoginPage.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");
        int userId = user.getId();

        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "UPDATE users SET name = ?, username = ?, email = ?, phone = ?, bio = ?, website = ? WHERE id = ?";

            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, fullName);
                stmt.setString(2, username);
                stmt.setString(3, email);
                stmt.setString(4, phone);
                stmt.setString(5, bio);
                stmt.setString(6, website);
                stmt.setInt(7, userId);

                int affectedRows = stmt.executeUpdate();

                if (affectedRows > 0) {
                    System.out.println("Profil berhasil diperbarui untuk user: " + username);
                } else {
                    System.out.println("Gagal memperbarui. Username tidak ditemukan: " + username);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException("Terjadi kesalahan database: " + e.getMessage(), e);
        }

        response.sendRedirect("Profil.jsp");
    }

    // Helper untuk hindari NullPointerException
    private String getSafeParam(HttpServletRequest request, String param) {
        String value = request.getParameter(param);
        return value != null ? value.trim() : "";
    }
}
