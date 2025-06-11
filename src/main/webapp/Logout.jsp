<%-- 
    Document   : Logout
    Created on : Jun 6, 2025, 5:57:25 PM
    Author     : DIVA OCTAVIANI
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HeiLo - Logout</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }
        
        body {
            background-color: #f5f5f5;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
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
        
        .logo {
            color: #00bfff;
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 20px;
        }
        
        .logout-icon {
            font-size: 60px;
            color: #00bfff;
            margin-bottom: 25px;
            animation: bounce 1s infinite alternate;
        }
        
        h2 {
            color: #333;
            margin-bottom: 15px;
            font-weight: 600;
        }
        
        p {
            color: #666;
            margin-bottom: 30px;
            line-height: 1.6;
        }
        
        .btn-group {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-top: 30px;
        }
        
        .btn {
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
        }
        
        .btn-primary {
            background-color: #00bfff;
            color: white;
        }
        
        .btn-primary:hover {
            background-color: #009acd;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 191, 255, 0.3);
        }
        
        .btn-outline {
            background-color: transparent;
            color: #666;
            border: 1px solid #ddd;
        }
        
        .btn-outline:hover {
            background-color: #f5f5f5;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        }
        
        .btn i {
            margin-right: 8px;
            font-size: 14px;
        }
        
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        @keyframes bounce {
            from {
                transform: translateY(0);
            }
            to {
                transform: translateY(-10px);
            }
        }
        
        /* Responsive adjustments */
        @media (max-width: 480px) {
            .logout-container {
                padding: 30px 20px;
                margin: 0 15px;
            }
            
            .btn-group {
                flex-direction: column;
                gap: 10px;
            }
            
            .btn {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="logout-container">
        <div class="logo">HeiLo</div>
        <div class="logout-icon">
            <i class="fas fa-sign-out-alt"></i>
        </div>
        <h2>Keluar dari HeiLo?</h2>
        <p>Anda yakin ingin keluar dari akun Anda? Anda perlu masuk kembali untuk menggunakan HeiLo.</p>
        
        <div class="btn-group">
            <form action="LogoutServlet" method="post">
                <button type="submit" class="btn btn-primary">
                    <i class="fas fa-sign-out-alt"></i> Ya, Keluar
                </button>
            </form>
            <a href="Beranda.jsp" class="btn btn-outline">
                <i class="fas fa-times"></i> Batal
            </a>
        </div>
    </div>

    <script>
        // Animasi tambahan untuk efek interaktif
        document.addEventListener('DOMContentLoaded', function() {
            const buttons = document.querySelectorAll('.btn');
            
            buttons.forEach(button => {
                button.addEventListener('mouseenter', function() {
                    this.style.transform = 'translateY(-2px)';
                });
                
                button.addEventListener('mouseleave', function() {
                    this.style.transform = 'translateY(0)';
                });
            });
        });
    </script>
</body>
</html>