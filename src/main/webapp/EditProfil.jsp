<%-- 
    Document   : EditProfil
    Created on : Jun 6, 2025, 4:02:33 PM
    Author     : DIVA OCTAVIANI
--%>

<%-- 
    Document   : EditProfil
    Created on : Jun 6, 2025, 10:00:00 AM
    Author     : DIVA OCTAVIANI
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HeiLo - Edit Profil</title>
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
            max-width: 800px;
            margin: 0 auto;
        }
        .edit-profile-card {
            background-color: white;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
        }
        .edit-title {
            font-size: 24px;
            color: #333;
            margin-bottom: 20px;
            text-align: center;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #555;
            font-weight: 500;
        }
        .form-control {
            width: 100%;
            padding: 10px 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-family: 'Poppins', sans-serif;
            font-size: 14px;
            transition: border-color 0.3s;
        }
        .form-control:focus {
            outline: none;
            border-color: #00bfff;
        }
        .avatar-upload {
            display: flex;
            align-items: center;
            gap: 20px;
            margin-bottom: 20px;
        }
        .avatar-preview {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            object-fit: cover;
            border: 3px solid #00bfff;
        }
        .upload-btn {
            background-color: #f0f0f0;
            color: #333;
            border: none;
            border-radius: 5px;
            padding: 8px 15px;
            font-family: 'Poppins', sans-serif;
            font-size: 14px;
            cursor: pointer;
            transition: all 0.3s;
        }
        .upload-btn:hover {
            background-color: #e0e0e0;
        }
        .btn-submit {
            background-color: #00bfff;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px 25px;
            font-family: 'Poppins', sans-serif;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: background-color 0.3s;
            display: block;
            margin: 30px auto 0;
        }
        .btn-submit:hover {
            background-color: #009acd;
        }
        .btn-cancel {
            background-color: #f5f5f5;
            color: #333;
            border: none;
            border-radius: 5px;
            padding: 10px 25px;
            font-family: 'Poppins', sans-serif;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: background-color 0.3s;
            display: block;
            margin: 15px auto 0;
        }
        .btn-cancel:hover {
            background-color: #e0e0e0;
        }
        .form-row {
            display: flex;
            gap: 20px;
        }
        .form-row .form-group {
            flex: 1;
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
                <a href="LogoutServlet"><i class="fas fa-sign-out-alt"></i> Logout</a>
            </div>
        </div>
    </nav>

    <div class="main-content">
        <div class="edit-profile-card">
            <h1 class="edit-title">Edit Profil</h1>
            
            <form action="UpdateProfileServlet" method="post">
                <div class="avatar-upload">
                    <img src="${pageContext.request.contextPath}/images/profil.jpeg" alt="Avatar" class="avatar-preview" id="avatarPreview">
                    <div>
                        <label for="avatarInput" class="upload-btn">Unggah Foto</label>
                        <input type="file" id="avatarInput" name="avatar" accept="image/*" style="display: none;" onchange="previewAvatar(event)">
                    </div>
                </div>

                <div class="form-group">
                    <label for="fullname">Nama Lengkap</label>
                    <input type="text" id="fullname" name="fullname" placeholder="Nama Lengkap" class="form-control" required>
                </div>

                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" placeholder="Username" class="form-control" required>
                </div>
                
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" placeholder="Email" class="form-control" required>
                </div>

                <div class="form-group">
                    <label for="phone">Nomor Telepon</label>
                    <input type="tel" id="phone" name="phone" placeholder="081234567890" required>
                </div>
                
                <div class="form-group">
                    <label for="bio">Bio</label>
                    <textarea id="bio" name="bio" class="form-control" rows="4">Hidup adalah perjalanan, nikmati setiap momennya ✨ | Fotografer amatir | Pecinta kopi</textarea>
                </div>
                
                <div class="form-group">
                    <label for="website">Website</label>
                    <input type="url" id="website" name="website" class="form-control" value="https://divaocta.my.id">
                </div>
                
                <button type="submit" class="btn-submit">Simpan Perubahan</button>
                <button type="button" class="btn-cancel" onclick="window.location.href='Profil.jsp'">Batal</button>
            </form>
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
        
        // Preview avatar when file is selected
        function previewAvatar(event) {
            const reader = new FileReader();
            reader.onload = function() {
                const output = document.getElementById('avatarPreview');
                output.src = reader.result;
            };
            reader.readAsDataURL(event.target.files[0]);
        }
    </script>
</body>
</html>