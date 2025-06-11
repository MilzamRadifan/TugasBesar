<%-- 
    Document   : Pencarian
    Created on : Jun 6, 2025, 1:47:50 PM
    Author     : DIVA OCTAVIANI
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HeiLo - Pencarian</title>
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
        
        /* Search Section */
        .search-container {
            margin-bottom: 30px;
        }
        .search-box {
            display: flex;
            align-items: center;
            background-color: white;
            border-radius: 30px;
            padding: 10px 20px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
        }
        .search-box i {
            color: #666;
            margin-right: 10px;
        }
        .search-input {
            flex: 1;
            border: none;
            outline: none;
            font-family: 'Poppins', sans-serif;
            font-size: 16px;
            color: #333;
        }
        
        /* Search Results */
        .search-results {
            background-color: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
        }
        .search-section-title {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 15px;
            color: #333;
        }
        .search-result-item {
            display: flex;
            align-items: center;
            padding: 10px 0;
            border-bottom: 1px solid #eee;
            cursor: pointer;
        }
        .search-result-item:last-child {
            border-bottom: none;
        }
        .search-result-avatar {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            object-fit: cover;
            margin-right: 15px;
        }
        .search-result-info {
            flex: 1;
        }
        .search-result-name {
            font-weight: bold;
            color: #333;
        }
        .search-result-username {
            font-size: 14px;
            color: #666;
        }
        .search-result-bio {
            font-size: 14px;
            color: #666;
            margin-top: 3px;
        }
        .follow-btn {
            background-color: #00bfff;
            color: white;
            border: none;
            border-radius: 20px;
            padding: 5px 15px;
            font-family: 'Poppins', sans-serif;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .follow-btn:hover {
            background-color: #009acd;
        }
        .follow-btn.following {
            background-color: #eee;
            color: #333;
        }
        
        /* No Results */
        .no-results {
            text-align: center;
            padding: 40px 0;
            color: #666;
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
            <a href="Pencarian.jsp" class="active">
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
        <div class="search-container">
            <div class="search-box">
                <i class="fas fa-search"></i>
                <input type="text" class="search-input" placeholder="Cari teman, postingan, atau hashtag..." id="searchInput">
            </div>
        </div>
        
        <div class="search-results">
            <div class="search-section-title">Hasil Pencarian</div>
            
            <!-- Sample search results -->
            <div class="search-result-item">
                <img src="${pageContext.request.contextPath}/images/min9yu_k.jpeg" alt="User" class="search-result-avatar">
                <div class="search-result-info">
                    <div class="search-result-name">Kim Mingyu</div>
                    <div class="search-result-username">@min9yu_k</div>
                    <div class="search-result-bio">Member SEVENTEEN | Actor | Model</div>
                </div>
                <button class="follow-btn" onclick="toggleFollow(this)">Ikuti</button>
            </div>
            
            <div class="search-result-item">
                <img src="${pageContext.request.contextPath}/images/nisaalj.jpeg" alt="User" class="search-result-avatar">
                <div class="search-result-info">
                    <div class="search-result-name">Annisa Al Jauhar</div>
                    <div class="search-result-username">@nisaalj</div>
                    <div class="search-result-bio">Mahasiswa | Fotografer Amatir</div>
                </div>
                <button class="follow-btn following" onclick="toggleFollow(this)">Mengikuti</button>
            </div>
            
            <div class="search-result-item">
                <img src="${pageContext.request.contextPath}/images/leejen_o_423.jpeg" alt="User" class="search-result-avatar">
                <div class="search-result-info">
                    <div class="search-result-name">Lee Jeno</div>
                    <div class="search-result-username">@leejen_o_423</div>
                    <div class="search-result-bio">NCT Dream | Dancer | Singer</div>
                </div>
                <button class="follow-btn" onclick="toggleFollow(this)">Ikuti</button>
            </div>
            
            <!-- No results state (hidden by default) -->
            <div class="no-results" id="noResults" style="display: none;">
                <i class="fas fa-search" style="font-size: 24px; margin-bottom: 10px;"></i>
                <div>Tidak ada hasil yang ditemukan</div>
                <div style="font-size: 14px; margin-top: 5px;">Coba dengan kata kunci yang berbeda</div>
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

        // Search functionality
        document.getElementById('searchInput').addEventListener('input', function() {
            const searchTerm = this.value.toLowerCase();
            const results = document.querySelectorAll('.search-result-item');
            let hasResults = false;
            
            results.forEach(result => {
                const name = result.querySelector('.search-result-name').textContent.toLowerCase();
                const username = result.querySelector('.search-result-username').textContent.toLowerCase();
                const bio = result.querySelector('.search-result-bio').textContent.toLowerCase();
                
                if (name.includes(searchTerm) || username.includes(searchTerm) || bio.includes(searchTerm)) {
                    result.style.display = 'flex';
                    hasResults = true;
                } else {
                    result.style.display = 'none';
                }
            });
            
            // Show no results message if no matches
            document.getElementById('noResults').style.display = hasResults ? 'none' : 'block';
        });
        
        // Follow button functionality
        function toggleFollow(button) {
            if (button.classList.contains('following')) {
                button.classList.remove('following');
                button.textContent = 'Ikuti';
            } else {
                button.classList.add('following');
                button.textContent = 'Mengikuti';
            }
        }

        // Logout functionality
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