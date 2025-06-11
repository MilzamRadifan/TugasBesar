package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/BerandaServlet")
public class BerandaServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Cek session user
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            // Jika tidak ada session, redirect ke halaman login
            response.sendRedirect("RegisterPage.jsp");
            return;
        }
        
        // Jika sudah login, forward ke Beranda.jsp
        request.getRequestDispatcher("Beranda.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Tangani aksi-aksi POST dari Beranda.jsp
        String action = request.getParameter("action");
        
        if (action != null) {
            switch (action) {
                case "logout":
                    handleLogout(request, response);
                    break;
                case "like":
                    handleLike(request, response);
                    break;
                case "comment":
                    handleComment(request, response);
                    break;
                case "repost":
                    handleRepost(request, response);
                    break;
                default:
                    response.sendRedirect("Beranda.jsp");
            }
        } else {
            response.sendRedirect("Beranda.jsp");
        }
    }
    
    private void handleLogout(HttpServletRequest request, HttpServletResponse response) 
            throws IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        response.sendRedirect("RegisterPage.jsp");
    }
    
    private void handleLike(HttpServletRequest request, HttpServletResponse response) 
            throws IOException, ServletException {
        // Implementasi like post
        String postId = request.getParameter("postId");
        // Lakukan operasi like ke database
        // ...
        
        // Kirim response JSON untuk AJAX
        response.setContentType("application/json");
        response.getWriter().write("{\"status\":\"success\", \"likes\": 125}");
    }
    
    private void handleComment(HttpServletRequest request, HttpServletResponse response) 
        throws IOException, ServletException {
    
    String postId = request.getParameter("postId");
    String commentText = request.getParameter("commentText");

    // Validasi input
    if (postId == null || commentText == null || commentText.trim().isEmpty()) {
        response.sendRedirect("Beranda.jsp");
        return;
    }

    // Simulasi simpan komentar ke database (implementasi sesuaikan)
    // CommentDAO.save(postId, commentText);

    // Kirim ke Pesan.jsp dengan parameter postId dan komentar
    request.setAttribute("postId", postId);
    request.setAttribute("commentText", commentText);
    request.getRequestDispatcher("Pesan.jsp").forward(request, response);
}

    
    private void handleRepost(HttpServletRequest request, HttpServletResponse response) 
            throws IOException, ServletException {
        // Implementasi repost
        String postId = request.getParameter("postId");
        // Lakukan operasi repost ke database
        // ...
        
        // Kirim response JSON untuk AJAX
        response.setContentType("application/json");
        response.getWriter().write("{\"status\":\"success\", \"reposts\": 5}");
    }
}