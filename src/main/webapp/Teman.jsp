<%-- 
    Document   : Teman
    Created on : Jun 6, 2025, 2:13:49 PM
    Author     : DIVA OCTAVIANI
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HeiLo - Teman</title>
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
        
        /* Friends Section */
        .friends-container {
            background-color: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
        }
        .friends-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .friends-title {
            font-size: 20px;
            font-weight: bold;
            color: #333;
        }
        .category-dropdown {
            position: relative;
            display: inline-block;
        }
        .category-btn {
            padding: 8px 15px;
            background-color: #00bfff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-family: 'Poppins', sans-serif;
            display: flex;
            align-items: center;
            gap: 8px;
        }
        .category-btn i {
            font-size: 14px;
        }
        .dropdown-content {
            display: none;
            position: absolute;
            background-color: white;
            min-width: 160px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.1);
            border-radius: 5px;
            z-index: 1;
            right: 0;
        }
        .dropdown-content a {
            color: #333;
            padding: 10px 15px;
            text-decoration: none;
            display: block;
            font-size: 14px;
            transition: background-color 0.3s;
        }
        .dropdown-content a:hover {
            background-color: #f1f1f1;
        }
        .dropdown-content a.active {
            background-color: #00bfff;
            color: white;
        }
        .show {
            display: block;
        }
        
        .friends-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 20px;
        }
        .friend-card {
            background-color: #f9f9f9;
            border-radius: 8px;
            padding: 15px;
            display: flex;
            flex-direction: column;
            align-items: center;
            transition: transform 0.3s;
            position: relative;
            overflow: hidden;
        }
        .friend-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        .friend-avatar {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 10px;
            border: 3px solid #00bfff;
        }
        .friend-name {
            font-weight: bold;
            margin-bottom: 5px;
            text-align: center;
        }
        .friend-username {
            color: #666;
            font-size: 14px;
            margin-bottom: 10px;
            text-align: center;
        }
        .friend-actions {
            display: flex;
            gap: 10px;
            width: 100%;
        }
        .friend-action {
            flex: 1;
            padding: 5px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-family: 'Poppins', sans-serif;
            font-size: 12px;
            transition: background-color 0.3s;
        }
        .message-btn {
            background-color: #00bfff;
            color: white;
        }
        .message-btn:hover {
            background-color: #009acd;
        }
        .unfriend-btn {
            background-color: #ff6b6b;
            color: white;
        }
        .unfriend-btn:hover {
            background-color: #ff5252;
        }
        
        /* Category Badges */
        .category-badge {
            position: absolute;
            top: 10px;
            right: 10px;
            padding: 3px 8px;
            border-radius: 10px;
            font-size: 10px;
            font-weight: bold;
            color: white;
        }
        .category-close {
            background-color: #00bfff;
        }
        .category-work {
            background-color: #4CAF50;
        }
        .category-family {
            background-color: #FF9800;
        }
        .category-school {
            background-color: #9C27B0;
        }
        .category-other {
            background-color: #607D8B;
        }
        
        /* Search Section */
        .search-section {
            background-color: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            margin-bottom: 20px;
        }
        .search-container {
            display: flex;
            gap: 10px;
        }
        .search-input {
            flex: 1;
            padding: 10px 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-family: 'Poppins', sans-serif;
            outline: none;
        }
        .search-btn {
            padding: 10px 20px;
            background-color: #00bfff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-family: 'Poppins', sans-serif;
            transition: background-color 0.3s;
        }
        .search-btn:hover {
            background-color: #009acd;
        }
        
        /* No Friends Message */
        .no-friends {
            grid-column: 1/-1;
            text-align: center;
            padding: 40px;
            color: #666;
        }
        
        /* Logout Confirmation Modal */
        .logout-modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.5);
            z-index: 1001;
            justify-content: center;
            align-items: center;
        }
        .logout-container {
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 450px;
            padding: 40px;
            text-align: center;
            animation: fadeIn 0.5s ease;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .logout-icon {
            font-size: 60px;
            color: #00bfff;
            margin-bottom: 25px;
        }
        .btn-group {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-top: 30px;
        }
        .btn-primary {
            padding: 12px 25px;
            border-radius: 30px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            border: none;
            font-size: 16px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            background-color: #00bfff;
            color: white;
        }
        .btn-outline {
            padding: 12px 25px;
            border-radius: 30px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            border: 1px solid #ddd;
            font-size: 16px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            background-color: transparent;
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
            <a href="Pencarian.jsp">
                <i class="fas fa-search"></i>
                <span class="nav-label">Cari</span>
            </a>
            <a href="Teman.jsp" class="active">
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
            <h1>Teman Anda</h1>
            <p>Kelola dan temukan teman-teman Anda di HeiLo</p>
        </section>
        
        <!-- Search Section -->
        <div class="search-section">
            <div class="search-container">
                <input type="text" class="search-input" placeholder="Cari teman...">
                <button class="search-btn"><i class="fas fa-search"></i> Cari</button>
            </div>
        </div>
        
        <!-- Friends Section -->
        <div class="friends-container">
            <div class="friends-header">
                <div class="friends-title">Daftar Teman</div>
                <div class="category-dropdown">
                    <button class="category-btn" onclick="toggleDropdown()">
                        <span id="currentCategory">Semua Teman</span>
                        <i class="fas fa-chevron-down"></i>
                    </button>
                    <div class="dropdown-content" id="categoryDropdown">
                        <a href="#" onclick="filterFriends('all')" class="active">Semua Teman</a>
                        <a href="#" onclick="filterFriends('close')">Teman Dekat</a>
                        <a href="#" onclick="filterFriends('followers')">Pengikut</a>
                        <a href="#" onclick="filterFriends('following')">Mengikuti</a>
                    </div>
                </div>
            </div>
            
            <div class="friends-grid" id="friendsGrid">
                <!-- Friend cards will be dynamically inserted here -->
            </div>
        </div>
    </div>
    
    <!-- Logout Confirmation Modal -->
    <div class="logout-modal" id="logoutModal">
        <div class="logout-container">
            <div class="logo">HeiLo</div>
            <div class="logout-icon">
                <i class="fas fa-sign-out-alt"></i>
            </div>
            <h2>Keluar dari HeiLo?</h2>
            <p>Anda yakin ingin keluar dari akun Anda? Anda perlu masuk kembali untuk menggunakan HeiLo.</p>

            <div class="btn-group">
                <button onclick="confirmLogout()" class="btn btn-primary">
                    <i class="fas fa-sign-out-alt"></i> Ya, Keluar
                </button>
                <button onclick="cancelLogout()" class="btn btn-outline">
                    <i class="fas fa-times"></i> Batal
                </button>
            </div>
        </div>
    </div>
    
    <script>
        // Sample friends data with categories
        const friendsData = [
            {
                id: 1,
                name: "Kim Mingyu",
                username: "min9yu_k",
                avatar: "<%= request.getContextPath() %> /images/min9yu_k.jpeg",
                addedDate: "2025-05-20",
                category: "close",
                lastInteraction: "2 hari lalu"
            },
            {
                id: 2,
                name: "Sherin Naura",
                username: "sherinnnauraa_",
                avatar: "<%= request.getContextPath() %> /images/profil.jpeg",
                addedDate: "2025-05-15",
                category: "family",
                lastInteraction: "1 minggu lalu"
            },
            {
                id: 3,
                name: "Nisa Alj",
                username: "nisaalj",
                avatar: "<%= request.getContextPath() %> /images/nisaalj.jpeg",
                addedDate: "2025-05-10",
                category: "school",
                lastInteraction: "3 hari lalu"
            },
            {
                id: 4,
                name: "Gita Rella",
                username: "rellgita",
                avatar: "<%= request.getContextPath() %>/images/profil.jpeg",
                addedDate: "2025-04-28",
                category: "work",
                lastInteraction: "2 minggu lalu"
            },
            {
                id: 5,
                name: "Lee Jeno",
                username: "leejen_o_423",
                avatar: "<%= request.getContextPath() %> /leejen_o_423.jpeg",
                addedDate: "2025-04-15",
                category: "close",
                lastInteraction: "1 hari lalu"
            },
            {
                id: 6,
                name: "Sau Dara",
                username: "sau_dara",
                avatar: "<%= request.getContextPath() %> /sau_dara.jpeg",
                addedDate: "2025-03-30",
                category: "other",
                lastInteraction: "1 bulan lalu"
            }
        ];
        
        // Initialize the page with all friends
        document.addEventListener('DOMContentLoaded', function() {
            renderFriends(friendsData);
            
            // Toggle dropdown menu for profile
            document.getElementById('profileDropdown').addEventListener('click', function(e) {
                e.stopPropagation();
                document.getElementById('dropdownMenu').classList.toggle('show-dropdown');
            });

            // Close dropdown when clicking outside
            window.addEventListener('click', function() {
                document.getElementById('dropdownMenu').classList.remove('show-dropdown');
            });
        });
        
        // Toggle dropdown menu for category filter
        function toggleDropdown() {
            document.getElementById("categoryDropdown").classList.toggle("show");
        }
        
        // Close the dropdown if clicked outside
        window.onclick = function(event) {
            if (!event.target.matches('.category-btn') && !event.target.closest('.category-dropdown')) {
                const dropdowns = document.getElementsByClassName("dropdown-content");
                for (let i = 0; i < dropdowns.length; i++) {
                    const openDropdown = dropdowns[i];
                    if (openDropdown.classList.contains('show')) {
                        openDropdown.classList.remove('show');
                    }
                }
            }
        }
        
        // Filter friends by category
        function filterFriends(category) {
            // Update active category in dropdown
            const dropdownLinks = document.querySelectorAll('.dropdown-content a');
            dropdownLinks.forEach(link => {
                link.classList.remove('active');
                if (link.getAttribute('onclick').includes(`'${category}'`)) {
                    link.classList.add('active');
                }
            });
            
            // Update current category button text
            let categoryName = "Semua Teman";
            switch(category) {
                case 'close': categoryName = "Teman Dekat"; break;
                case 'followers': categoryName = "Pengikut"; break;
                case 'following': categoryName = "Mengikuti"; break;
            }
            document.getElementById('currentCategory').textContent = categoryName;
            
            // Filter friends
            if (category === 'all') {
                renderFriends(friendsData);
            } else {
                const filteredFriends = friendsData.filter(friend => friend.category === category);
                renderFriends(filteredFriends);
            }
            
            // Close dropdown
            document.getElementById("categoryDropdown").classList.remove("show");
        }
        
        // Render friends list
        function renderFriends(friends) {
            const friendsGrid = document.getElementById('friendsGrid');
            
            if (friends.length === 0) {
                friendsGrid.innerHTML = '<div class="no-friends">Tidak ada teman dalam kategori ini</div>';
                return;
            }
            
            friendsGrid.innerHTML = '';
            
            friends.forEach(friend => {
                // Determine category badge
                let categoryBadge = '';
                let categoryClass = '';
                let categoryText = '';
                
                switch(friend.category) {
                    case 'close':
                        categoryClass = 'category-close';
                        categoryText = 'Dekat';
                        break;
                    case 'work':
                        categoryClass = 'category-work';
                        categoryText = 'Kerja';
                        break;
                    case 'family':
                        categoryClass = 'category-family';
                        categoryText = 'Keluarga';
                        break;
                    case 'school':
                        categoryClass = 'category-school';
                        categoryText = 'Sekolah';
                        break;
                    case 'other':
                        categoryClass = 'category-other';
                        categoryText = 'Lainnya';
                        break;
                }
                
                if (categoryClass && categoryText) {
                    categoryBadge = `<span class="category-badge ${categoryClass}">${categoryText}</span>`;
                }
                
                const friendCard = document.createElement('div');
                friendCard.className = 'friend-card';
                friendCard.innerHTML = `
                    ${categoryBadge}
                    <img src="${friend.avatar}" alt="Friend" class="friend-avatar">
                    <div class="friend-name">${friend.name}</div>
                    <div class="friend-username">${friend.username}</div>
                    <div class="friend-actions">
                        <button class="friend-action message-btn" onclick="messageFriend(${friend.id})"><i class="fas fa-paper-plane"></i> Pesan</button>
                        <button class="friend-action unfriend-btn" onclick="unfriend(${friend.id})"><i class="fas fa-user-minus"></i> Hapus</button>
                    </div>
                `;
                friendsGrid.appendChild(friendCard);
            });
        }
        
        // Message friend function
        function messageFriend(friendId) {
            alert(`Mengirim pesan ke teman dengan ID: ${friendId}`);
            // Here you would typically redirect to messages page or open a chat modal
        }
        
        // Unfriend function
        function unfriend(friendId) {
            if (confirm('Apakah Anda yakin ingin menghapus teman ini?')) {
                alert(`Teman dengan ID: ${friendId} telah dihapus`);
                // Here you would typically make an AJAX call to remove the friend from your database
                // Then refresh the friends list
            }
        }
        
        // Search functionality
        document.querySelector('.search-btn').addEventListener('click', function() {
            const searchTerm = document.querySelector('.search-input').value.toLowerCase();
            const currentCategory = document.querySelector('.dropdown-content a.active')
                .getAttribute('onclick').match(/'([^']+)'/)[1];
            
            let filteredFriends = friendsData;
            
            // First filter by current category
            if (currentCategory !== 'all') {
                filteredFriends = friendsData.filter(friend => friend.category === currentCategory);
            }
            
            // Then filter by search term if provided
            if (searchTerm) {
                filteredFriends = filteredFriends.filter(friend => 
                    friend.name.toLowerCase().includes(searchTerm) || 
                    friend.username.toLowerCase().includes(searchTerm)
                );
            }
            
            renderFriends(filteredFriends);
        });
        
        // Handle Enter key for search
        document.querySelector('.search-input').addEventListener('keypress', function(e) {
            if (e.key === 'Enter') {
                document.querySelector('.search-btn').click();
            }
        });
        
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