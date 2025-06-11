<%-- 
    Document   : ResetPassword
    Created on : Jun 5, 2025, 9:17:54 PM
    Author     : DIVA OCTAVIANI
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HeiLo - Reset Password</title>
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
        .container {
            width: 850px;
            height: 500px;
            background-color: white;
            display: flex;
            border-radius: 20px;
            box-shadow: 0 0 20px rgba(0, 191, 255, 0.3);
            overflow: hidden;
        }

        /* LEFT PANEL: Password reset form */
        .left-panel {
            flex: 1.2;
            padding: 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        /* RIGHT PANEL: Success message */
        .right-panel {
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

        /* Style for reset form */
        .left-panel h3 {
            font-size: 22px;
            color: #333;
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            font-size: 14px;
            color: #555;
            display: block;
            margin-bottom: 5px;
        }
        input {
            width: 100%;
            padding: 10px;
            border-radius: 6px;
            border: 1px solid #ccc;
            background-color: #f8f8f8;
        }
        .save-btn {
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
        .save-btn:hover {
            background-color: #009fd9;
        }

        /* Success message */
        .right-panel h2 {
            font-size: 28px;
            margin-bottom: 10px;
        }
        .right-panel p {
            font-size: 14px;
            margin-bottom: 25px;
        }
        .btn-login {
            border: 2px solid white;
            background: none;
            color: white;
            padding: 10px 20px;
            border-radius: 20px;
            font-size: 14px;
            cursor: pointer;
            transition: background-color 0.3s, color 0.3s;
        }
        .btn-login:hover {
            background-color: white;
            color: #00bfff;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="left-panel">
        <h3>Buat Kata Sandi Baru</h3>
        <form action="UpdatePasswordServlet" method="post">
            <input type="hidden" name="token" value="${param.token}">
            <div class="form-group">
                <label for="new-password">Kata Sandi Baru</label>
                <input type="password" id="new-password" name="newPassword" placeholder="********" required>
            </div>
            <div class="form-group">
                <label for="confirm-password">Konfirmasi Kata Sandi</label>
                <input type="password" id="confirm-password" name="confirmPassword" placeholder="********" required>
            </div>
            <button class="save-btn" type="submit">Simpan Password</button>
        </form>
    </div>
    <div class="right-panel">
        <h2>Password Berhasil Diubah!</h2>
        <p>Kata sandi Anda telah berhasil direset. Silakan masuk dengan kata sandi baru Anda.</p>
        <form action="Masuk.jsp">
            <button class="btn-login">Masuk Sekarang</button>
        </form>
    </div>
</div>
</body>
</html>