<%-- 
    Document   : RegisterPage
    Created on : Jun 5, 2025, 4:57:02 PM
    Author     : DIVA OCTAVIANI
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HeiLo - Auth</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0; padding: 0; box-sizing: border-box;
        }
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #d8f3ff, #f0faff);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .wrapper {
            width: 850px;
            height: 500px;
            position: relative;
            overflow: hidden;
            border-radius: 20px;
            box-shadow: 0 0 20px rgba(0, 191, 255, 0.3);
        }
        .container {
            display: flex;
            width: 200%;
            height: 100%;
            transition: transform 0.7s ease;
        }

        /* Form Panels */
        .form-panel {
            flex: 1.2;
            padding: 40px;
            background-color: white;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        .form-panel h3 {
            font-size: 22px;
            color: #333;
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-panel label {
            font-size: 14px;
            color: #555;
            display: block;
            margin-bottom: 5px;
        }
        .form-panel input {
            width: 100%;
            padding: 10px;
            border-radius: 6px;
            border: 1px solid #ccc;
            background-color: #f8f8f8;
        }
        .form-btn {
            width: 100%;
            padding: 10px;
            background-color: #00bfff;
            color: white;
            border: none;
            font-size: 16px;
            border-radius: 6px;
            margin-top: 15px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .form-btn:hover {
            background-color: #009fd9;
        }
        .forgot {
            text-align: right;
            font-size: 12px;
            margin-top: 5px;
        }
        .forgot a {
            color: #00bfff;
            text-decoration: none;
        }
        .forgot a:hover {
            text-decoration: underline;
        }

        /* Info Panels */
        .info-panel {
            flex: 1;
            background-color: #00bfff;
            color: white;
            padding: 40px 30px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
        }
        .info-panel h2 {
            font-size: 28px;
            margin-bottom: 10px;
        }
        .info-panel p {
            font-size: 14px;
            margin-bottom: 25px;
        }
        .panel-btn {
            border: 2px solid white;
            background: none;
            color: white;
            padding: 10px 20px;
            border-radius: 20px;
            font-size: 14px;
            cursor: pointer;
            transition: background-color 0.3s, color 0.3s;
        }
        .panel-btn:hover {
            background-color: white;
            color: #00bfff;
        }
    </style>
</head>
<body>
<div class="wrapper">
    <%-- Tambahkan ini untuk menampilkan error --%>
    <div class="error-message" style="color: red; margin-bottom: 15px; text-align: center;">
        <% if (request.getAttribute("error") != null) { %>
            <%= request.getAttribute("error") %>
        <% } %>
    </div>
    
    <div class="container" id="container">
        <!-- Login Section -->
        <div class="form-panel">
            <h3>Masuk ke HeiLo</h3>
            <form action="LoginServlet" method="post">
                <div class="form-group">
                    <label for="username">Nomor Telepon atau Email</label>
                    <input type="text" id="username" name="username" placeholder="contoh@email.com" required>
                </div>
                <div class="form-group">
                    <label for="password">Kata Sandi</label>
                    <input type="password" id="password" name="password" placeholder="********" required>
                </div>
                <div class="forgot">
                    <a href="#">Lupa kata sandi?</a>
                </div>
                <button class="form-btn" type="submit">Masuk</button>
            </form>
        </div>

        <div class="info-panel">
            <h2>Hai, Selamat Datang!</h2>
            <p>Belum punya akun?</p>
            <button class="panel-btn" onclick="switchToRegister()">Daftar</button>
        </div>

        <!-- Register Section -->
        <div class="info-panel">
            <h2>Sudah punya akun?</h2>
            <p>Masuk untuk mengakses akun Anda</p>
            <button class="panel-btn" onclick="switchToLogin()">Masuk</button>
        </div>

        <div class="form-panel">
            <h3>Daftar ke HeiLo</h3>
            
            <form action="RegisterServlet" method="post">
                <div class="form-group">
                    <label for="name">Nama Lengkap</label>
                    <input type="text" id="name" name="name" placeholder="Nama Anda" required>
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" placeholder="contoh@email.com" required>
                </div>
                <div class="form-group">
                    <label for="phone">Nomor Telepon</label>
                    <input type="tel" id="phone" name="phone" placeholder="081234567890" required>
                </div>
                <div class="form-group">
                    <label for="new-password">Kata Sandi</label>
                    <input type="password" id="new-password" name="password" placeholder="********" required>
                </div>
                <button class="form-btn" type="submit">Daftar</button>
            </form>
        </div>
    </div>
</div>
<script>
    function switchToRegister() {
        document.getElementById('container').style.transform = 'translateX(-50%)';
    }

    function switchToLogin() {
        document.getElementById('container').style.transform = 'translateX(0%)';
    }
</script>
</body>
</html>