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

@WebServlet("/KomentarServlet")
public class KomentarServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        
        // 1. Get and validate parameters
        String komentar = request.getParameter("komentar");
        String postId = request.getParameter("postId");
        
        // Validate input
        if (komentar == null || komentar.trim().isEmpty() || postId == null || !postId.matches("\\d+")) {
            session.setAttribute("errorMessage", "Invalid comment data");
            response.sendRedirect("Pesan.jsp");
            return;
        }
        
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try {
            // 2. Get database connection
            conn = DatabaseConnection.getConnection();
            
            // 3. Prepare SQL with additional fields (user_id, timestamp)
            String sql = "INSERT INTO komentar (post_id, user_id, isi, waktu_komentar) VALUES (?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            
            // Get user ID from session
            Integer userId = (Integer) session.getAttribute("userId");
            if (userId == null) {
                session.setAttribute("errorMessage", "Please login to comment");
                response.sendRedirect("Login.jsp");
                return;
            }
            
            // 4. Set parameters
            stmt.setInt(1, Integer.parseInt(postId));
            stmt.setInt(2, userId);
            stmt.setString(3, komentar.trim());
            stmt.setObject(4, LocalDateTime.now());
            
            // 5. Execute update
            int rowsAffected = stmt.executeUpdate();
            
            if (rowsAffected > 0) {
                session.setAttribute("successMessage", "Comment posted successfully");
            } else {
                session.setAttribute("errorMessage", "Failed to post comment");
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
            session.setAttribute("errorMessage", "Database error: " + e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("errorMessage", "System error: " + e.getMessage());
        } finally {
            // 6. Close resources properly
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        // 7. Redirect to Pesan.jsp instead of Beranda.jsp
        response.sendRedirect("Pesan.jsp");
    }
}
