<%-- 
    Document   : Beranda
    Created on : Jun 5, 2025, 9:18:45 PM
    Author     : DIVA OCTAVIANI
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HeiLo - Beranda</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            margin: 0; padding: 0; box-sizing: border-box;
        }
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f5f5f5;
        }
        .navbar {
            background-color: white;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 15px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: sticky;
            top: 0;
            z-index: 100;
        }
        .logo {
            color: #00bfff;
            font-size: 24px;
            font-weight: bold;
        }
        .nav-links {
            display: flex;
            gap: 30px;
        }
        .nav-links a {
            color: #333;
            text-decoration: none;
            font-size: 24px;
            transition: color 0.3s;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .nav-links a.active {
            color: #00bfff;
        }
        .nav-links a:hover {
            color: #00bfff;
        }
        .nav-label {
            font-size: 10px;
            margin-top: 2px;
        }
        .user-profile {
            display: flex;
            align-items: center;
            gap: 10px;
            cursor: pointer;
            padding: 5px 10px;
            border-radius: 20px;
            transition: background-color 0.3s;
            position: relative;
        }
        .user-profile:hover {
            background-color: #f0f0f0;
        }
        .user-profile img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            object-fit: cover;
            border: 2px solid #00bfff;
        }
        .dropdown-menu {
            display: none;
            position: absolute;
            right: 0;
            top: 60px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            width: 200px;
            z-index: 1000;
            overflow: hidden;
        }
        .dropdown-menu a {
            display: block;
            padding: 12px 15px;
            color: #333;
            text-decoration: none;
            transition: all 0.3s;
        }
        .dropdown-menu a:hover {
            background-color: #f5f5f5;
            color: #00bfff;
        }
        .dropdown-menu i {
            width: 20px;
            margin-right: 10px;
            text-align: center;
        }
        .show-dropdown {
            display: block !important;
        }
        .main-content {
            padding: 20px 40px;
            max-width: 1200px;
            margin: 0 auto;
        }
        .welcome-section {
            background-color: white;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            margin-bottom: 30px;
        }
        .welcome-section h1 {
            color: #333;
            margin-bottom: 10px;
        }
        .welcome-section p {
            color: #666;
        }
        
        /* Story Section */
        .story-container {
            background-color: white;
            border-radius: 10px;
            padding: 15px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            margin-bottom: 30px;
            overflow-x: auto;
        }
        .story-wrapper {
            display: flex;
            gap: 15px;
            padding: 5px;
        }
        .story-item {
            display: flex;
            flex-direction: column;
            align-items: center;
            cursor: pointer;
        }
        .story-avatar {
            width: 70px;
            height: 70px;
            border-radius: 50%;
            object-fit: cover;
            border: 3px solid transparent;
            background: linear-gradient(45deg, #ff9a9e, #fad0c4, #fbc2eb, #a6c1ee);
            padding: 2px;
        }
        .story-avatar.viewed {
            border-color: #ddd;
            background: none;
        }
        .story-username {
            margin-top: 5px;
            font-size: 12px;
            color: #333;
            max-width: 70px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }
        
        /* Feed Section */
        .feed-container {
            display: grid;
            grid-template-columns: 1fr;
            gap: 20px;
        }
        .post-card {
            background-color: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
        }
        .post-header {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }
        .post-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            object-fit: cover;
            margin-right: 10px;
        }
        .post-user {
            font-weight: bold;
            color: #333;
        }
        .post-time {
            font-size: 12px;
            color: #999;
            margin-top: 2px;
        }
        .post-content {
            margin-bottom: 15px;
            color: #333;
        }
        .post-image {
            width: 50%;
            border-radius: 8px;
            margin-bottom: 15px;
            max-height: 500px;
            object-fit: cover;
        }
        .post-actions {
            display: flex;
            gap: 15px;
            border-top: 1px solid #eee;
            padding-top: 15px;
        }
        .post-action {
            display: flex;
            align-items: center;
            gap: 5px;
            color: #555;
            cursor: pointer;
            background: none;
            border: none;
            font-family: 'Poppins', sans-serif;
            font-size: 14px;
            padding: 5px 10px;
            border-radius: 5px;
            transition: all 0.3s;
        }
        .post-action:hover {
            background-color: #f0f0f0;
            color: #00bfff;
        }
        .post-action.liked {
            color: #ff0000;
        }
        .post-action.commented {
            color: #00bfff;
        }
        .post-action.reposted {
            color: #00bfff;
        }
        .post-action.repost-btn:hover {
            color: #00bfff;
        }
        
        /* Comments Section */
        .comments-section {
            margin-top: 15px;
            border-top: 1px solid #eee;
            padding-top: 15px;
            display: none;
        }
        .comment {
            display: flex;
            margin-bottom: 12px;
        }
        .comment-avatar {
            width: 32px;
            height: 32px;
            border-radius: 50%;
            object-fit: cover;
            margin-right: 10px;
        }
        .comment-content {
            flex: 1;
        }
        .comment-user {
            font-weight: bold;
            font-size: 14px;
            color: #333;
        }
        .comment-text {
            font-size: 14px;
            color: #333;
            margin-top: 2px;
        }
        .comment-time {
            font-size: 11px;
            color: #999;
            margin-top: 2px;
        }
        .add-comment {
            display: flex;
            margin-top: 15px;
        }
        .comment-input {
            flex: 1;
            border: 1px solid #ddd;
            border-radius: 20px;
            padding: 8px 15px;
            font-family: 'Poppins', sans-serif;
            font-size: 14px;
            outline: none;
            resize: none;
            height: 40px;
        }
        .comment-submit {
            background-color: #00bfff;
            color: white;
            border: none;
            border-radius: 20px;
            padding: 0 20px;
            margin-left: 10px;
            cursor: pointer;
            font-family: 'Poppins', sans-serif;
            font-weight: bold;
            transition: background-color 0.3s;
        }
        .comment-submit:hover {
            background-color: #009acd;
        }
        
        /* Story Viewer Modal */
        .story-modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.9);
            z-index: 1000;
            justify-content: center;
            align-items: center;
        }
        .story-viewer {
            position: relative;
            width: 350px;
            height: 600px;
            background-color: #000;
            border-radius: 10px;
            overflow: hidden;
        }
        .story-header {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            padding: 15px;
            display: flex;
            align-items: center;
            z-index: 2;
        }
        .story-progress {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            display: flex;
            gap: 5px;
            padding: 10px;
        }
        .progress-bar {
            height: 3px;
            background-color: rgba(255, 255, 255, 0.4);
            flex-grow: 1;
            border-radius: 3px;
            overflow: hidden;
        }
        .progress-fill {
            height: 100%;
            width: 0%;
            background-color: white;
        }
        .story-user {
            display: flex;
            align-items: center;
            color: white;
        }
        .story-user-avatar {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            object-fit: cover;
            margin-right: 10px;
        }
        .story-close {
            position: absolute;
            top: 15px;
            right: 15px;
            color: white;
            font-size: 24px;
            cursor: pointer;
            z-index: 3;
        }
        .story-content {
            width: 100%;
            height: 100%;
            object-fit: contain;
        }
        .story-nav {
            position: absolute;
            top: 0;
            width: 50%;
            height: 100%;
            cursor: pointer;
        }
        .story-prev {
            left: 0;
        }
        .story-next {
            right: 0;
        }
        
        /* Comment Modal */
        .comment-modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 1000;
            justify-content: center;
            align-items: center;
        }
        /* Story Comment Footer */
        .story-footer {
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            padding: 15px;
            z-index: 2;
        }
        .story-comment {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .story-comment-input {
            flex: 1;
            border: none;
            border-radius: 20px;
            padding: 10px 15px;
            background-color: rgba(255,255,255,0.2);
            color: white;
        }
        .story-comment-btn {
            background-color: #00bfff;
            color: white;
            border: none;
            border-radius: 50%;
            width: 40px;
            height: 40px;
            cursor: pointer;
        }

        .comment-modal-content {
            background-color: white;
            border-radius: 10px;
            width: 500px;
            max-height: 80vh;
            overflow: hidden;
            display: flex;
            flex-direction: column;
        }
        .comment-modal-header {
            padding: 15px;
            border-bottom: 1px solid #eee;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .comment-modal-title {
            font-weight: bold;
            font-size: 18px;
        }
        .comment-modal-close {
            font-size: 24px;
            cursor: pointer;
            color: #666;
        }
        .comment-modal-body {
            flex: 1;
            overflow-y: auto;
            padding: 15px;
        }
        .comment-modal-footer {
            padding: 15px;
            border-top: 1px solid #eee;
        }
    </style>
</head>
<body>
    <nav class="navbar">
        <div class="logo">HeiLo</div>
        <div class="nav-links">
            <a href="#" class="active">
                <i class="fas fa-home"></i>
                <span class="nav-label">Beranda</span>
            </a>
            <a href="Pencarian.jsp">
                <i class="fas fa-search"></i>
                <span class="nav-label">Cari</span>
            </a>
            <a href="Teman.jsp">
                <i class="fas fa-user-friends"></i>
                <span class="nav-label">Teman</span>
            </a>
            <a href="Pesan.jsp">
                <i class="fas fa-paper-plane"></i>
                <span class="nav-label">Pesan</span>
            </a>
        </div>
        <div class="user-profile" id="profileDropdown">
            <span>${sessionScope.user.name}</span>
            <img src="${pageContext.request.contextPath}/images/profil.jpeg" alt="Profile">
            
            <div class="dropdown-menu" id="dropdownMenu">
                <a href="Profil.jsp"><i class="fas fa-user"></i> Profil Saya</a>
                <a href="EditProfil.jsp"><i class="fas fa-edit"></i> Edit Profil</a>
                <a href="#" id="logoutLink"><i class="fas fa-sign-out-alt"></i> Logout</a>
            </div>
        </div>
    </nav>

    <div class="main-content">
        <section class="welcome-section">
            <h1>HeiLo, ${sessionScope.user.name}!</h1>
            <p>Apa yang ingin kamu bagikan hari ini?</p>
        </section>
        
        <!-- Story Section -->
        <div class="story-container">
            <div class="story-wrapper">
                <!-- Your Story -->
                <div class="story-item">
                    <div style="position: relative;">
                        <img src="${pageContext.request.contextPath}/images/profil.jpeg" alt="Your Story" class="story-avatar">
                        <div style="position: absolute; bottom: 0; right: 0; background-color: #00bfff; width: 20px; height: 20px; border-radius: 50%; display: flex; justify-content: center; align-items: center; color: white; font-size: 12px; border: 2px solid white;">+</div>
                    </div>
                    <span class="story-username">Story Anda</span>
                </div>
                
                <!-- Friends Stories -->
                <div class="story-item" onclick="openStory(1)">
                    <img src="${pageContext.request.contextPath}/images/min9yu_k.jpeg" alt="User" class="story-avatar">
                    <span class="story-username">min9yu_k</span>
                </div>
                <div class="story-item" onclick="openStory(2)">
                    <img src="${pageContext.request.contextPath}/images/profil.jpeg" alt="User" class="story-avatar">
                    <span class="story-username">sherinnnauraa_</span>
                </div>
                <div class="story-item" onclick="openStory(3)">
                    <img src="${pageContext.request.contextPath}/images/nisaalj.jpeg" alt="User" class="story-avatar viewed">
                    <span class="story-username">nisaalj</span>
                </div>
                <div class="story-item" onclick="openStory(4)">
                    <img src="${pageContext.request.contextPath}/images/profil.jpeg" alt="User" class="story-avatar">
                    <span class="story-username">rellgita</span>
                </div>
                <div class="story-item" onclick="openStory(5)">
                    <img src="${pageContext.request.contextPath}/images/leejen_o_423.jpeg" alt="User" class="story-avatar viewed">
                    <span class="story-username">leejen_o_423</span>
                </div>
                <div class="story-item" onclick="openStory(6)">
                    <img src="${pageContext.request.contextPath}/images/sau_dara.jpeg" alt="User" class="story-avatar">
                    <span class="story-username">sau_dara</span>
                </div>
            </div>
        </div>
        
        <!-- Feed Section -->
        <div class="feed-container">
            <div class="post-card">
                <div class="post-header">
                    <img src="${pageContext.request.contextPath}/images/min9yu_k.jpeg" alt="User" class="post-avatar">
                    <div>
                        <div class="post-user">min9yu_k</div>
                        <div class="post-time">2 jam yang lalu</div>
                    </div>
                </div>
                <div class="post-content">
                    Hari yang indah untuk bersantai di pantai! ☀️🏖️ #summervibes
                </div>
                <img src="${pageContext.request.contextPath}/images/mingyu_post.jpeg" alt="Post Image" class="post-image">
                <div class="post-actions">
                    <button class="post-action like-btn" onclick="toggleLike(this)">
                        <i class="far fa-thumbs-up"></i>
                        <span class="like-count">125</span>
                    </button>
                    <button class="post-action comment-btn" onclick="toggleComments(this)">
                        <i class="far fa-comment"></i>
                        <span class="comment-count">23</span>
                    </button>
                    <button class="post-action repost-btn" onclick="repostPost(this)">
                        <i class="fas fa-retweet"></i>
                        <span class="repost-count">5</span>
                    </button>
                </div>
                
                <!-- Comments Section -->
                <div class="comments-section">
                    <div class="comment">
                        <img src="${pageContext.request.contextPath}/images/profil.jpeg" alt="User" class="comment-avatar">
                        <div class="comment-content">
                            <div class="comment-user">sherinnnauraa_</div>
                            <div class="comment-text">Wah keren banget! Pantainya dimana nih?</div>
                            <div class="comment-time">1 jam yang lalu</div>
                        </div>
                    </div>
                    <div class="comment">
                        <img src="${pageContext.request.contextPath}/images/nisaalj.jpeg" alt="User" class="comment-avatar">
                        <div class="comment-content">
                            <div class="comment-user">nisaalj</div>
                            <div class="comment-text">Cakep banget viewnya 😍</div>
                            <div class="comment-time">45 menit yang lalu</div>
                        </div>
                    </div>
                    
                   
                </div>
            </div>
                                
            <div class="post-card">
                <div class="post-header">
                    <img src="${pageContext.request.contextPath}/images/profil.jpeg" alt="User" class="post-avatar">
                    <div>
                        <div class="post-user">sherinnnauraa_</div>
                        <div class="post-time">5 jam yang lalu</div>
                    </div>
                </div>
                <div class="post-content">
                    Baru saja mencoba resep masakan baru, hasilnya lumayan enak! Siapa yang mau coba? 😋 #homecooking
                </div>
                <img src="${pageContext.request.contextPath}/images/sherin_post.jpeg" alt="Post Image" class="post-image">
                <div class="post-actions">
                    <button class="post-action like-btn" onclick="toggleLike(this)">
                        <i class="far fa-thumbs-up"></i>
                        <span class="like-count">89</span>
                    </button>
                    <button class="post-action comment-btn" onclick="toggleComments(this)">
                        <i class="far fa-comment"></i>
                        <span class="comment-count">15</span>
                    </button>
                    <button class="post-action repost-btn" onclick="repostPost(this)">
                        <i class="fas fa-retweet"></i>
                        <span class="repost-count">2</span>
                    </button>
                </div>
                
                <!-- Comments Section -->
                <div class="comments-section">
                    <div class="comment">
                        <img src="${pageContext.request.contextPath}/images/min9yu_k.jpeg" alt="User" class="comment-avatar">
                        <div class="comment-content">
                            <div class="comment-user">min9yu_k</div>
                            <div class="comment-text">Resepnya share dong!</div>
                            <div class="comment-time">3 jam yang lalu</div>
                        </div>
                    </div>
                    <div class="comment">
                        <img src="${pageContext.request.contextPath}/images/leejen_o_423.jpeg" alt="User" class="comment-avatar">
                        <div class="comment-content">
                            <div class="comment-user">leejen_o_423</div>
                            <div class="comment-text">Aku mau coba nanti weekend 😊</div>
                            <div class="comment-time">2 jam yang lalu</div>
                        </div>
                    </div>
                    
                    <!-- Add Comment Form -->
                    <form action="BerandaServlet" method="post">
                        <input type="hidden" name="action" value="comment">
                        <input type="hidden" name="postId" value="${post.id}">
                        <textarea name="commentText" placeholder="Tulis komentar..."></textarea>
                        <button type="submit">Komentar</button>
                    </form>

                </div>
            </div>
        </div>
    </div>
    
    <!-- Story Viewer Modal -->
    <div class="story-modal" id="storyModal">
        <div class="story-viewer">
            <div class="story-progress">
                <div class="progress-bar"><div class="progress-fill"></div></div>
            </div>
            <div class="story-header">
                <div class="story-user">
                    <img src="" alt="User" class="story-user-avatar" id="storyUserAvatar">
                    <span id="storyUsername"></span>
                </div>
                        
            </div>
            <span class="story-close" onclick="closeStory()">×</span>
            <img src="" alt="Story" class="story-content" id="storyContent">
            
            <div class="story-footer">
                <div class="story-comment">
                    <input type="text" placeholder="Kirim pesan..." class="story-comment-input">
                    <button class="story-comment-btn" onclick="sendStoryComment()">
                        <i class="fas fa-paper-plane"></i>
                    </button>
                </div>
            </div>
            
            <div class="story-nav story-prev" onclick="prevStory()"></div>
            <div class="story-nav story-next" onclick="nextStory()"></div>
        </div>
    </div>
    
    <!-- Comment Modal (for mobile view) -->
    <div class="comment-modal" id="commentModal">
        <div class="comment-modal-content">
            <div class="comment-modal-header">
                <div class="comment-modal-title">Komentar</div>
                <div class="comment-modal-close" onclick="closeCommentModal()">×</div>
            </div>
            <div class="comment-modal-body" id="commentModalBody">
                <!-- Comments will be loaded here -->
            </div>
            <div class="comment-modal-footer">
                <div class="add-comment">
                    <img src="${pageContext.request.contextPath}/images/profil.jpeg" alt="User" class="comment-avatar">
                    <textarea class="comment-input" placeholder="Tulis komentar..." id="modalCommentInput"></textarea>
                    <button class="comment-submit" onclick="addModalComment()">Kirim</button>
                </div>
            </div>
        </div>
    </div>
     
    <!-- Logout Confirmation Modal -->
    <div class="logout-modal" id="logoutModal" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0,0,0,0.5); z-index: 1001; justify-content: center; align-items: center;">
        <div class="logout-container" style="background-color: white; border-radius: 15px; box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1); width: 100%; max-width: 450px; padding: 40px; text-align: center; animation: fadeIn 0.5s ease;">
            <div class="logo" style="color: #00bfff; font-size: 28px; font-weight: bold; margin-bottom: 20px;">HeiLo</div>
            <div class="logout-icon" style="font-size: 60px; color: #00bfff; margin-bottom: 25px;">
                <i class="fas fa-sign-out-alt"></i>
            </div>
            <h2 style="color: #333; margin-bottom: 15px; font-weight: 600;">Keluar dari HeiLo?</h2>
            <p style="color: #666; margin-bottom: 30px; line-height: 1.6;">Anda yakin ingin keluar dari akun Anda? Anda perlu masuk kembali untuk menggunakan HeiLo.</p>

            <div class="btn-group" style="display: flex; justify-content: center; gap: 15px; margin-top: 30px;">
                <button onclick="confirmLogout()" class="btn btn-primary" style="padding: 12px 25px; border-radius: 30px; font-weight: 500; cursor: pointer; transition: all 0.3s ease; border: none; font-size: 16px; display: inline-flex; align-items: center; justify-content: center; background-color: #00bfff; color: white;">
                    <i class="fas fa-sign-out-alt"></i> Ya, Keluar
                </button>
                <button onclick="cancelLogout()" class="btn btn-outline" style="padding: 12px 25px; border-radius: 30px; font-weight: 500; cursor: pointer; transition: all 0.3s ease; border: 1px solid #ddd; font-size: 16px; display: inline-flex; align-items: center; justify-content: center; background-color: transparent; color: #666;">
                    <i class="fas fa-times"></i> Batal
                </button>
            </div>
        </div>
    </div>
    
    <script>
        // Toggle dropdown menu
        document.getElementById('profileDropdown').addEventListener('click', function(e) {
            e.stopPropagation();
            document.getElementById('dropdownMenu').classList.toggle('show-dropdown');
        });

        // Close dropdown when clicking outside
        window.addEventListener('click', function() {
            document.getElementById('dropdownMenu').classList.remove('show-dropdown');
        });
        

        // Sample story data
        const stories = [
            {
                id: 1,
                username: "min9yu_k",
                avatar: "${pageContext.request.contextPath}/images/min9yu_k.jpeg",
                content: "${pageContext.request.contextPath}/images/mingyu_story.jpeg",
                comments: []
            },
            {
                id: 2,
                username: "sherinnnauraa_",
                avatar: "${pageContext.request.contextPath}/images/profil.jpeg",
                content: "${pageContext.request.contextPath}/images/sherin_story.jpeg",
                comments: []
            },
            {
                id: 3,
                username: "nisaalj",
                avatar: "${pageContext.request.contextPath}/images/nisaalj.jpeg",
                content: "${pageContext.request.contextPath}/images/nisaalj_story.jpeg",
                comments: []
            },
            {
                id: 4,
                username: "rellgita",
                avatar: "${pageContext.request.contextPath}/images/profil.jpeg",
                content: "${pageContext.request.contextPath}/images/gita_story.jpeg",
                comments: []
            },
            {
                id: 5,
                username: "leejen_o_423",
                avatar: "${pageContext.request.contextPath}/images/leejen_o_423.jpeg",
                content: "${pageContext.request.contextPath}/images/jeno_story.jpeg",
                comments: []
            },
            {
                id: 6,
                username: "sau_dara",
                avatar: "${pageContext.request.contextPath}/images/sau_dara.jpeg",
                content: "${pageContext.request.contextPath}/images/dara_story.jpeg",
                comments: []
            }
        ];
        
        let currentStoryIndex = 0;
        let currentPostIdForModal = null;
        
        function openStory(storyId) {
            const story = stories.find(s => s.id === storyId);
            if (!story) return;
            
            currentStoryIndex = stories.findIndex(s => s.id === storyId);
            
            document.getElementById('storyUserAvatar').src = story.avatar;
            document.getElementById('storyUsername').textContent = story.username;
            document.getElementById('storyContent').src = story.content;
            
            document.getElementById('storyModal').style.display = 'flex';
            startStoryProgress();
        }
        
        function closeStory() {
            document.getElementById('storyModal').style.display = 'none';
            resetStoryProgress();
        }
        
        function prevStory() {
            if (currentStoryIndex > 0) {
                currentStoryIndex--;
                updateStoryView();
                resetStoryProgress();
                startStoryProgress();
            }
        }
        
        function nextStory() {
            if (currentStoryIndex < stories.length - 1) {
                currentStoryIndex++;
                updateStoryView();
                resetStoryProgress();
                startStoryProgress();
            } else {
                closeStory();
            }
        }
        
        function sendStoryComment() {
        const commentInput = document.querySelector('.story-comment-input');
        const comment = commentInput.value.trim();

        if (!comment) return;

        const currentStory = stories[currentStoryIndex];
        alert(`Komentar untuk ${currentStory.username}: "${comment}" akan masuk ke Pesan.jsp`);

        // Simpan komentar ke session atau database (contoh AJAX):
        fetch('SaveStoryComment', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({
                storyId: currentStory.id,
                comment: comment,
                userId: "${sessionScope.user.id}" // Asumsi ada session user
            })
        })
        .then(response => response.json())
        .then(data => {
            commentInput.value = ''; // Kosongkan input
        });
    }
        
        function updateStoryView() {
            const story = stories[currentStoryIndex];
            document.getElementById('storyUserAvatar').src = story.avatar;
            document.getElementById('storyUsername').textContent = story.username;
            document.getElementById('storyContent').src = story.content;
        }
        
        function startStoryProgress() {
            const progressFill = document.querySelector('.progress-fill');
            progressFill.style.width = '100%';
            progressFill.style.transition = 'width 5s linear';
            
            setTimeout(() => {
                nextStory();
            }, 10000);
        }
        
        function resetStoryProgress() {
            const progressFill = document.querySelector('.progress-fill');
            progressFill.style.width = '0%';
            progressFill.style.transition = 'none';
        }
        
        // Close modal when clicking outside the story viewer
        document.getElementById('storyModal').addEventListener('click', function(e) {
            if (e.target === this) {
                closeStory();
            }
        });
        
        // Like functionality
        function toggleLike(button) {
            const likeIcon = button.querySelector('i');
            const likeCount = button.querySelector('.like-count');
            
            if (button.classList.contains('liked')) {
                // Unlike
                button.classList.remove('liked');
                likeIcon.classList.remove('fas');
                likeIcon.classList.add('far');
                likeCount.textContent = parseInt(likeCount.textContent) - 1;
            } else {
                // Like
                button.classList.add('liked');
                likeIcon.classList.remove('far');
                likeIcon.classList.add('fas');
                likeCount.textContent = parseInt(likeCount.textContent) + 1;
            }
        }
        
        // Comment functionality
        function toggleComments(button) {
            // Check if mobile view
            if (window.innerWidth <= 768) {
                openCommentModal(button);
                return;
            }
            
            const postCard = button.closest('.post-card');
            const commentsSection = postCard.querySelector('.comments-section');
            
            if (commentsSection.style.display === 'block') {
                commentsSection.style.display = 'none';
                button.classList.remove('commented');
            } else {
                commentsSection.style.display = 'block';
                button.classList.add('commented');
            }
        }
        
        function openCommentModal(button) {
            const postCard = button.closest('.post-card');
            const commentsSection = postCard.querySelector('.comments-section');
            const comments = commentsSection.innerHTML;
            
            document.getElementById('commentModalBody').innerHTML = comments;
            currentPostIdForModal = postCard.id || '1'; // Default to 1 if no id
            document.getElementById('commentModal').style.display = 'flex';
        }
        
        function closeCommentModal() {
            document.getElementById('commentModal').style.display = 'none';
        }
        
        // Add comment to regular post
        function addComment(postId) {
            const commentInput = document.getElementById(`commentInput${postId}`);
            const commentText = commentInput.value.trim();
            
            if (commentText === '') return;
            
            const commentsSection = document.querySelectorAll('.post-card')[postId-1].querySelector('.comments-section');
            
            // Create new comment element
            const newComment = document.createElement('div');
            newComment.className = 'comment';
            newComment.innerHTML = `
                <img src="${pageContext.request.contextPath}/images/profil.jpeg" alt="User" class="comment-avatar">
                <div class="comment-content">
                    <div class="comment-user">${document.querySelector('.user-profile span').textContent}</div>
                    <div class="comment-text">${commentText}</div>
                    <div class="comment-time">Baru saja</div>
                </div>
            `;
            
            // Insert before the add-comment form
            const addCommentForm = commentsSection.querySelector('.add-comment');
            commentsSection.insertBefore(newComment, addCommentForm);
            
            // Update comment count
            const commentCount = document.querySelectorAll('.post-card')[postId-1].querySelector('.comment-count');
            commentCount.textContent = parseInt(commentCount.textContent) + 1;
            
            // Clear input
            commentInput.value = '';
        }
        
        // Add comment from modal
        function addModalComment() {
            const commentInput = document.getElementById('modalCommentInput');
            const commentText = commentInput.value.trim();
            
            if (commentText === '') return;
            
            const commentModalBody = document.getElementById('commentModalBody');
            
            // Create new comment element
            const newComment = document.createElement('div');
            newComment.className = 'comment';
            newComment.innerHTML = `
                <img src="${pageContext.request.contextPath}/images/profil.jpeg" alt="User" class="comment-avatar">
                <div class="comment-content">
                    <div class="comment-user">${document.querySelector('.user-profile span').textContent}</div>
                    <div class="comment-text">${commentText}</div>
                    <div class="comment-time">Baru saja</div>
                </div>
            `;
            
            // Insert before the add-comment form
            const addCommentForm = commentModalBody.querySelector('.add-comment');
            commentModalBody.insertBefore(newComment, addCommentForm);
            
            // Update comment count in the original post
            if (currentPostIdForModal) {
                const commentCount = document.querySelectorAll('.post-card')[currentPostIdForModal-1].querySelector('.comment-count');
                if (commentCount) {
                    commentCount.textContent = parseInt(commentCount.textContent) + 1;
                }
            }
            
            // Clear input
            commentInput.value = '';
        }
        
        // Repost functionality
        function repostPost(button) {
            const repostIcon = button.querySelector('i');
            const repostCount = button.querySelector('.repost-count');
            
            if (button.classList.contains('reposted')) {
                // Unrepost
                if (confirm('Batalkan repost?')) {
                    button.classList.remove('reposted');
                    repostCount.textContent = parseInt(repostCount.textContent) - 1;
                }
            } else {
                // Repost
                if (confirm('Apakah Anda ingin membagikan ulang postingan ini?')) {
                    button.classList.add('reposted');
                    repostCount.textContent = parseInt(repostCount.textContent) + 1;
                }
            }
        }
        
        // Close comment modal when clicking outside
        document.getElementById('commentModal').addEventListener('click', function(e) {
            if (e.target === this) {
                closeCommentModal();
            }
        });
        
        // Handle Enter key for comment input
        document.addEventListener('keypress', function(e) {
            if (e.key === 'Enter' && e.target.classList.contains('comment-input')) {
                e.preventDefault();
                if (e.target.id === 'modalCommentInput') {
                    addModalComment();
                } else {
                    const postId = e.target.id.replace('commentInput', '');
                    addComment(postId);
                }
            }
        });
        
        // Logout confirmation
        document.getElementById('logoutLink').addEventListener('click', function(e) {
            e.preventDefault();
            document.getElementById('logoutModal').style.display = 'flex';
        });

        function confirmLogout() {
            window.location.href = 'RegisterPage.jsp';
        }

        function cancelLogout() {
            document.getElementById('logoutModal').style.display = 'none';
        }

        // Close modal when clicking outside
        document.getElementById('logoutModal').addEventListener('click', function(e) {
            if (e.target === this) {
                cancelLogout();
            }
        });
        
    </script>
</body>
</html>