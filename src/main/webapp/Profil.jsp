<%-- 
    Document   : Profil
    Created on : Jun 6, 2025, 3:53:38 PM
    Author     : DIVA OCTAVIANI
--%>

<%-- 
    Document   : Profil
    Created on : Jun 6, 2025, 10:00:00 AM
    Author     : DIVA OCTAVIANI
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HeiLo - Profil Saya</title>
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
        .profile-header {
            background-color: white;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            margin-bottom: 30px;
            display: flex;
            align-items: center;
            gap: 30px;
        }
        .profile-avatar {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            border: 5px solid #00bfff;
        }
        .profile-info {
            flex: 1;
        }
        .profile-name {
            font-size: 28px;
            color: #333;
            margin-bottom: 10px;
        }
        .profile-bio {
            color: #666;
            margin-bottom: 15px;
        }
        .profile-stats {
            display: flex;
            gap: 20px;
        }
        .stat-item {
            text-align: center;
        }
        .stat-count {
            font-weight: bold;
            font-size: 18px;
            color: #333;
        }
        .stat-label {
            font-size: 14px;
            color: #666;
        }
        .profile-actions {
            margin-top: 20px;
        }
        .edit-profile-btn {
            background-color: #00bfff;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 8px 20px;
            font-family: 'Poppins', sans-serif;
            font-size: 14px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .edit-profile-btn:hover {
            background-color: #009acd;
        }
        .profile-posts {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 15px;
        }
        .post-thumbnail {
            width: 100%;
            height: 300px;
            object-fit: cover;
            border-radius: 8px;
            cursor: pointer;
            transition: transform 0.3s;
        }
        .post-thumbnail:hover {
            transform: scale(1.02);
        }
        .section-title {
            font-size: 20px;
            color: #333;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 1px solid #eee;
        }
    </style>
</head>
<body>
    <nav class="navbar">
        <div class="logo">HeiLo</div>
        <div class="nav-links">
            <a href="Beranda.jsp">
                <i class="fas fa-home"></i>
                <span class="nav-label">Beranda</span>
            </a>
            <a href="#">
                <i class="fas fa-search"></i>
                <span class="nav-label">Cari</span>
            </a>
            <a href="Teman.jsp">
                <i class="fas fa-user-friends"></i>
                <span class="nav-label">Teman</span>
            </a>
            <a href="#">
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
                <a href="#" id="logoutLink"><i  class="fas fa-sign-out-alt"></i> Logout</a>
            </div>
        </div>
    </nav>

    <div class="main-content">
        <section class="profile-header">
            <img src="${pageContext.request.contextPath}/images/profil.jpeg" alt="Profile" class="profile-avatar">
            <div class="profile-info">
                <h1 class="profile-name">${sessionScope.user.name}</h1>
                <p class="profile-bio">Hidup adalah perjalanan, nikmati setiap momennya ✨ | Fotografer amatir | Pecinta kopi</p>
                
                <div class="profile-stats">
                    <div class="stat-item">
                        <div class="stat-count">245</div>
                        <div class="stat-label">Postingan</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-count">1.2k</div>
                        <div class="stat-label">Pengikut</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-count">587</div>
                        <div class="stat-label">Mengikuti</div>
                    </div>
                </div>
                
                <div class="profile-actions">
                    <button class="edit-profile-btn" onclick="window.location.href='EditProfil.jsp'">Edit Profil</button>
                </div>
            </div>
        </section>
        
        <section>
            <h2 class="section-title">Postingan Saya</h2>
            <div class="profile-posts">
                <img src="${pageContext.request.contextPath}/images/post1.jpeg" alt="Post" class="post-thumbnail">
                <img src="${pageContext.request.contextPath}/images/post2.jpeg" alt="Post" class="post-thumbnail">
                <img src="${pageContext.request.contextPath}/images/post3.jpeg" alt="Post" class="post-thumbnail">
                <img src="${pageContext.request.contextPath}/images/post4.jpeg" alt="Post" class="post-thumbnail">
                <img src="${pageContext.request.contextPath}/images/post5.jpeg" alt="Post" class="post-thumbnail">
                <img src="${pageContext.request.contextPath}/images/post6.jpeg" alt="Post" class="post-thumbnail">
            </div>
        </section>
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