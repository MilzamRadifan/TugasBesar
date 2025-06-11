package servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDateTime;
import servlet.DatabaseConnection;

@WebServlet("/PesanServlet")
public class PesanServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Integer pengirimId = (Integer) session.getAttribute("userId");
        String penerimaId = request.getParameter("penerimaId");
        String isiPesan = request.getParameter("pesan");

        if (pengirimId == null || penerimaId == null || isiPesan == null || isiPesan.trim().isEmpty()) {
            session.setAttribute("errorMessage", "Pesan tidak valid");
            response.sendRedirect("Pesan.jsp");
            return;
        }

        try (Connection conn = DatabaseConnection.getConnection()) {
            // ✅ Disesuaikan dengan nama kolom di tabel `messages`
            String sql = "INSERT INTO messages (sender_id, receiver_id, content, created_at, is_read) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, pengirimId);
            stmt.setInt(2, Integer.parseInt(penerimaId));
            stmt.setString(3, isiPesan.trim());
            stmt.setObject(4, LocalDateTime.now());
            stmt.setBoolean(5, false); // Pesan awal = belum dibaca

            int rows = stmt.executeUpdate();
            if (rows > 0) {
                session.setAttribute("successMessage", "Pesan terkirim");
            } else {
                session.setAttribute("errorMessage", "Gagal mengirim pesan");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            session.setAttribute("errorMessage", "DB Error: " + e.getMessage());
        }

        response.sendRedirect("Pesan.jsp?penerimaId=" + penerimaId);
    }
}
