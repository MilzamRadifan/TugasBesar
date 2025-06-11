<%-- 
    Document   : Pesan
    Created on : Jun 6, 2025, 2:54:49 PM
    Author     : DIVA OCTAVIANI
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String storyId = request.getParameter("storyId");
    if (storyId != null) {
        // Ambil komentar dari database (contoh pseudo-code)
        // List<StoryComment> comments = commentService.getByStoryId(storyId);
        // request.setAttribute("storyComments", comments);
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HeiLo - Pesan</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            margin: 0; padding: 0; box-sizing: border-box;
        }
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f5f5f5;
            height: 100vh;
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
            display: flex;
            height: calc(100vh - 70px);
        }
        /* Sidebar */
        .messages-sidebar {
            width: 350px;
            background-color: white;
            border-right: 1px solid #eee;
            overflow-y: auto;
            display: flex;
            flex-direction: column;
        }
        .messages-header {
            padding: 20px;
            border-bottom: 1px solid #eee;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .messages-header h2 {
            font-size: 20px;
            color: #333;
        }
        .new-message-btn {
            background-color: #00bfff;
            color: white;
            border: none;
            border-radius: 50%;
            width: 30px;
            height: 30px;
            display: flex;
            justify-content: center;
            align-items: center;
            cursor: pointer;
        }
        .search-bar {
            padding: 10px 20px;
            border-bottom: 1px solid #eee;
        }
        .search-input {
            width: 100%;
            padding: 8px 15px;
            border-radius: 20px;
            border: 1px solid #ddd;
            font-family: 'Poppins', sans-serif;
            outline: none;
        }
        .conversation-list {
            list-style: none;
            flex: 1;
            overflow-y: auto;
        }
        .conversation-item {
            padding: 15px 20px;
            border-bottom: 1px solid #eee;
            display: flex;
            align-items: center;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .conversation-item:hover {
            background-color: #f9f9f9;
        }
        .conversation-item.active {
            background-color: #f0f0f0;
        }
        .conversation-avatar {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            object-fit: cover;
            margin-right: 15px;
        }
        .conversation-info {
            flex: 1;
            min-width: 0;
        }
        .conversation-user {
            font-weight: bold;
            color: #333;
            margin-bottom: 3px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        .conversation-preview {
            font-size: 14px;
            color: #777;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        .conversation-time {
            font-size: 12px;
            color: #999;
            margin-left: 10px;
            white-space: nowrap;
        }
        /* Chat Area */
        .chat-area {
            flex: 1;
            display: flex;
            flex-direction: column;
            background-color: #fafafa;
            position: relative;
            height: 100%;
        }
        .chat-header {
            padding: 15px 20px;
            border-bottom: 1px solid #eee;
            background-color: white;
            display: flex;
            align-items: center;
        }
        .chat-user {
            font-weight: bold;
            color: #333;
            margin-left: 10px;
        }
        .chat-messages {
            flex: 1;
            padding: 20px;
            overflow-y: auto;
            height: calc(100% - 120px);
        }
        .message {
            margin-bottom: 15px;
            display: flex;
            flex-direction: column;
            max-width: 80%;
        }
        .message.received {
            align-items: flex-start;
        }
        .message.sent {
            align-items: flex-end;
        }
        .message-content {
            padding: 10px 15px;
            border-radius: 18px;
            font-size: 14px;
            line-height: 1.4;
            position: relative;
            word-wrap: break-word;
        }
        .message.received .message-content {
            background-color: white;
            border: 1px solid #eee;
            border-top-left-radius: 0;
        }
        .message.sent .message-content {
            background-color: #00bfff;
            color: white;
            border-top-right-radius: 0;
        }
        .message-time {
            font-size: 11px;
            color: #999;
            margin-top: 5px;
        }
        .chat-input-area {
            padding: 15px 20px;
            background-color: white;
            border-top: 1px solid #eee;
            display: flex;
            align-items: center;
        }
        .chat-input {
            flex: 1;
            padding: 10px 15px;
            border-radius: 20px;
            border: 1px solid #ddd;
            font-family: 'Poppins', sans-serif;
            outline: none;
            resize: none;
            height: 40px;
            max-height: 100px;
            overflow-y: auto;
        }
        .send-btn {
            background-color: #00bfff;
            color: white;
            border: none;
            border-radius: 50%;
            width: 40px;
            height: 40px;
            margin-left: 10px;
            display: flex;
            justify-content: center;
            align-items: center;
            cursor: pointer;
        }
        /* Empty State */
        .empty-chat {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100%;
            color: #999;
            text-align: center;
            padding: 20px;
        }
        .empty-chat i {
            font-size: 50px;
            margin-bottom: 15px;
            color: #ddd;
        }
        .empty-chat h3 {
            margin-bottom: 10px;
            color: #666;
        }
        .empty-chat p {
            max-width: 300px;
        }

        #chatContent {
            display: none;
            flex-direction: column;
            flex: 1;
            height: 100%;
            overflow: hidden;
        }

        /* Modal untuk Pesan Baru */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.5);
            z-index: 1000;
            justify-content: center;
            align-items: center;
        }
        .modal-content {
            background-color: white;
            border-radius: 10px;
            width: 400px;
            max-width: 90%;
        }
        .modal-header {
            padding: 15px 20px;
            border-bottom: 1px solid #eee;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .modal-header h3 {
            font-size: 18px;
        }
        .modal-header button {
            background: none;
            border: none;
            font-size: 20px;
            cursor: pointer;
        }
        .modal-body {
            padding: 20px;
        }
        .friend-list {
            max-height: 300px;
            overflow-y: auto;
        }
        .friend-item {
            padding: 10px;
            display: flex;
            align-items: center;
            cursor: pointer;
            border-bottom: 1px solid #eee;
        }
        .friend-item:hover {
            background-color: #f5f5f5;
        }
        .friend-item img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            object-fit: cover;
            margin-right: 10px;
        }
        .modal-footer {
            padding: 15px 20px;
            border-top: 1px solid #eee;
            text-align: right;
        }
        .modal-footer button {
            padding: 8px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .modal-footer button:first-child {
            background-color: #f0f0f0;
            margin-right: 10px;
        }
        .modal-footer button:last-child {
            background-color: #00bfff;
            color: white;
        }
        
        /* Logout Modal */
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
        .btn {
            padding: 12px 25px;
            border-radius: 30px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            font-size: 16px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }
        .btn-primary {
            background-color: #00bfff;
            color: white;
            border: none;
        }
        .btn-outline {
            background-color: transparent;
            color: #666;
            border: 1px solid #ddd;
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
            <a href="Teman.jsp">
                <i class="fas fa-user-friends"></i>
                <span class="nav-label">Teman</span>
            </a>
            <a href="Pesan.jsp" class="active">
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
        <!-- Sidebar dengan daftar percakapan -->
        <div class="messages-sidebar">
            <div class="messages-header">
                <h2>Pesan</h2>
                <button class="new-message-btn" onclick="openNewMessageModal()">
                    <i class="fas fa-plus"></i>
                </button>
            </div>
            <div class="search-bar">
                <input type="text" class="search-input" placeholder="Cari pesan...">
            </div>
            <ul class="conversation-list">
                <!-- Percakapan dengan min9yu_k -->
                <li class="conversation-item" onclick="loadConversation(1, this)">
                    <img src="${pageContext.request.contextPath}/images/min9yu_k.jpeg" alt="min9yu_k" class="conversation-avatar">
                    <div class="conversation-info">
                        <div class="conversation-user">min9yu_k</div>
                        <div class="conversation-preview">Kamu: Nanti jam berapa kita ketemuan?</div>
                    </div>
                    <div class="conversation-time">12.30</div>
                </li>
                
                <!-- Percakapan dengan nisaalj -->
                <li class="conversation-item" onclick="loadConversation(2)">
                    <img src="${pageContext.request.contextPath}/images/nisaalj.jpeg" alt="nisaalj" class="conversation-avatar">
                    <div class="conversation-info">
                        <div class="conversation-user">nisaalj</div>
                        <div class="conversation-preview">Resep kue yang kamu kirim kemarin enak banget!</div>
                    </div>
                    <div class="conversation-time">10.15</div>
                </li>
                
                <!-- Percakapan dengan leejen_o_423 -->
                <li class="conversation-item" onclick="loadConversation(3)">
                    <img src="${pageContext.request.contextPath}/images/leejen_o_423.jpeg" alt="leejen_o_423" class="conversation-avatar">
                    <div class="conversation-info">
                        <div class="conversation-user">leejen_o_423</div>
                        <div class="conversation-preview">Udah nonton film yang aku rekomendasiin?</div>
                    </div>
                    <div class="conversation-time">Kemarin</div>
                </li>
                
                <!-- Percakapan dengan sherinnnauraa_ -->
                <li class="conversation-item" onclick="loadConversation(4)">
                    <img src="${pageContext.request.contextPath}/images/profil.jpeg" alt="sherinnnauraa_" class="conversation-avatar">
                    <div class="conversation-info">
                        <div class="conversation-user">sherinnnauraa_</div>
                        <div class="conversation-preview">Makasih ya udah bantu aku kemarin</div>
                    </div>
                    <div class="conversation-time">Kemarin</div>
                </li>
                
                <!-- Percakapan dengan rellgita -->
                <li class="conversation-item" onclick="loadConversation(5)">
                    <img src="${pageContext.request.contextPath}/images/profil.jpeg" alt="rellgita" class="conversation-avatar">
                    <div class="conversation-info">
                        <div class="conversation-user">rellgita</div>
                        <div class="conversation-preview">Liburan besok ke mana?</div>
                    </div>
                    <div class="conversation-time">Senin</div>
                </li>
            </ul>
        </div>
        
        <!-- Area Chat -->
        <div class="chat-area">
            <!-- Empty State (ditampilkan awal) -->
            <div class="empty-chat" id="emptyChatState">
                <i class="fas fa-comment-dots"></i>
                <h3>Pesan Anda</h3>
                <p>Klik percakapan untuk melihat pesan atau mulai percakapan baru</p>
            </div>

            <!-- Chat Content (awalnya disembunyikan) -->
            <div id="chatContent">
                <!-- Header Chat (akan diisi oleh JavaScript) -->
                <div class="chat-header" id="chatHeader">
                    <img src="" alt="User" class="conversation-avatar" id="chatAvatar">
                    <div class="chat-user" id="chatUserName"></div>
                </div>

                <!-- Daftar Pesan (akan diisi oleh JavaScript) -->
                <div class="chat-messages" id="chatMessages"></div>

                <!-- Input Pesan -->
                <div class="chat-input-area">
                    <textarea class="chat-input" placeholder="Ketik pesan..." id="messageInput"></textarea>
                    <button class="send-btn" onclick="sendMessage()">
                        <i class="fas fa-paper-plane"></i>
                    </button>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Modal untuk Pesan Baru -->
    <div class="modal" id="newMessageModal">
        <div class="modal-content">
            <div class="modal-header">
                <h3>Pesan Baru</h3>
                <button onclick="closeNewMessageModal()">×</button>
            </div>
            <div class="modal-body">
                <input type="text" placeholder="Cari teman..." style="width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 5px; margin-bottom: 15px;">
                <div class="friend-list">
                    <!-- Daftar teman -->
                    <div class="friend-item" onclick="selectFriend(1)">
                        <img src="${pageContext.request.contextPath}/images/min9yu_k.jpeg" alt="min9yu_k">
                        <div>
                            <div style="font-weight: bold;">min9yu_k</div>
                            <div style="font-size: 12px; color: #777;">Kim Mingyu</div>
                        </div>
                    </div>
                    <div class="friend-item" onclick="selectFriend(2)">
                        <img src="${pageContext.request.contextPath}/images/nisaalj.jpeg" alt="nisaalj">
                        <div>
                            <div style="font-weight: bold;">nisaalj</div>
                            <div style="font-size: 12px; color: #777;">Nisa Al Jauhari</div>
                        </div>
                    </div>
                    <div class="friend-item" onclick="selectFriend(3)">
                        <img src="${pageContext.request.contextPath}/images/leejen_o_423.jpeg" alt="leejen_o_423">
                        <div>
                            <div style="font-weight: bold;">leejen_o_423</div>
                            <div style="font-size: 12px; color: #777;">Lee Jeno</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button onclick="closeNewMessageModal()">Batal</button>
                <button onclick="startNewConversation()">Kirim</button>
            </div>
        </div>
    </div>
    
    <!-- Logout Confirmation Modal -->
    <div class="logout-modal" id="logoutModal">
        <div class="logout-container">
            <div class="logo" style="color: #00bfff; font-size: 28px; font-weight: bold; margin-bottom: 20px;">HeiLo</div>
            <div class="logout-icon">
                <i class="fas fa-sign-out-alt"></i>
            </div>
            <h2 style="color: #333; margin-bottom: 15px; font-weight: 600;">Keluar dari HeiLo?</h2>
            <p style="color: #666; margin-bottom: 30px; line-height: 1.6;">Anda yakin ingin keluar dari akun Anda? Anda perlu masuk kembali untuk menggunakan HeiLo.</p>

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
        // Toggle dropdown menu
        document.getElementById('profileDropdown').addEventListener('click', function(e) {
            e.stopPropagation();
            document.getElementById('dropdownMenu').classList.toggle('show-dropdown');
        });

        // Close dropdown when clicking outside
        window.addEventListener('click', function() {
            document.getElementById('dropdownMenu').classList.remove('show-dropdown');
        });

        // Data percakapan dengan contoh pesan yang lebih lengkap
        const conversations = {
            1: {
                name: "min9yu_k",
                avatar: "${pageContext.request.contextPath}/images/min9yu_k.jpeg",
                messages: [
                    { content: "Hai, apa kabar?", time: "12.05", received: true },
                    { content: "Baik, kamu gimana?", time: "12.10", received: false },
                    { content: "Aku juga baik. Nanti jam berapa kita ketemuan?", time: "12.15", received: true },
                    { content: "Jam 2 siang gimana? Di kafe biasa aja", time: "12.20", received: false },
                    { content: "Oke, deal! Aku bawa temanku ya, dia juga mau ikut", time: "12.25", received: true },
                    { content: "Sampai ketemu nanti ya! Jangan lupa bawa buku yang aku pinjamkan", time: "12.30", received: false }
                ]
            },
            2: {
                name: "nisaalj",
                avatar: "${pageContext.request.contextPath}/images/nisaalj.jpeg",
                messages: [
                    { content: "Resep kue yang kamu kirim kemarin enak banget! Aku coba tadi pagi", time: "10.00", received: true },
                    { content: "Wah seneng denger itu! Aku juga suka resep itu, gampang banget kan?", time: "10.05", received: false },
                    { content: "Iya, bahan-bahannya gampang dicari juga. Aku modif dikit pake coklat lebih banyak", time: "10.10", received: true },
                    { content: "Wah pasti lebih enak tuh! Next time aku mau cobain versi kamu", time: "10.15", received: false }
                ]
            },
            3: {
                name: "leejen_o_423",
                avatar: "${pageContext.request.contextPath}/images/leejen_o_423.jpeg",
                messages: [
                    { content: "Udah nonton film yang aku rekomendasiin kemarin?", time: "Kemarin 20.30", received: true },
                    { content: "Belum, aku masih sibuk ngerjain tugas akhir nih. Deadline minggu depan", time: "Kemarin 21.00", received: false },
                    { content: "Oh iya, semangat ya! Kalo udah selesai dan sempat nonton, kasih tau pendapatmu. Aku penasaran!", time: "Kemarin 21.05", received: true }
                ]
            },
            4: {
                name: "sherinnnauraa_",
                avatar: "${pageContext.request.contextPath}/images/profil.jpeg",
                messages: [
                    { content: "Makasih ya udah bantu aku kemarin ngerjain laporan praktikum", time: "Kemarin 18.00", received: true },
                    { content: "Iya sama-sama! Kapan-kapan bantuin aku juga ya kalo aku kesulitan", time: "Kemarin 18.30", received: false }
                ]
            },
            5: {
                name: "rellgita",
                avatar: "${pageContext.request.contextPath}/images/profil.jpeg",
                messages: [
                    { content: "Liburan besok ke mana? Aku denger kamu mau jalan-jalan", time: "Senin 15.00", received: true },
                    { content: "Kayaknya ke Bandung aja, mau kulineran sama belanja di factory outlet", time: "Senin 15.30", received: false },
                    { content: "Wah asik! Kalo pulang jangan lupa bawa oleh-oleh ya, terutama brownies ama batagor!", time: "Senin 15.35", received: true }
                ]
            }
        };
        
        // Variabel untuk menyimpan percakapan aktif
        let activeConversationId = null;
        let selectedFriendId = null;
        
        // Fungsi untuk memuat percakapan
        function loadConversation(userId, element) {
    console.log("Memuat percakapan:", userId);
    
    // Validasi data
    if (!conversations[userId]) {
        console.error("Data percakapan tidak ditemukan untuk ID:", userId);
        return;
    }

    // Update UI
    document.getElementById('emptyChatState').style.display = 'none';
    const chatContent = document.getElementById('chatContent');
    chatContent.style.display = 'flex';
    
    // Force reflow untuk memastikan rendering
    void chatContent.offsetHeight;

    // Isi konten chat
    const conversation = conversations[userId];
    document.getElementById('chatAvatar').src = conversation.avatar;
    document.getElementById('chatUserName').textContent = conversation.name;
    
    const chatMessages = document.getElementById('chatMessages');
    chatMessages.innerHTML = '';
    
    conversation.messages.forEach(msg => {
        const msgDiv = document.createElement('div');
        msgDiv.className = `message ${msg.received ? 'received' : 'sent'}`;
        msgDiv.innerHTML = `
            <div class="message-content">${msg.content}</div>
            <div class="message-time">${msg.time}</div>
        `;
        chatMessages.appendChild(msgDiv);
    });

    // Scroll ke bawah
    setTimeout(() => {
        chatMessages.scrollTop = chatMessages.scrollHeight;
    }, 50);
}

        // Fungsi untuk menambahkan pesan ke chat
        function addMessageToChat(content, isReceived, time = null) {
            const chatMessages = document.getElementById('chatMessages');
            
            const messageDiv = document.createElement('div');
            messageDiv.className = `message ${isReceived ? 'received' : 'sent'}`;
            
            const timeText = time || getCurrentTime();
            
            messageDiv.innerHTML = `
                <div class="message-content">
                    ${content}
                </div>
                <div class="message-time">${timeText}</div>
            `;
            
            chatMessages.appendChild(messageDiv);
            scrollToBottom();
        }
        
        // Fungsi untuk mengirim pesan
        function sendMessage() {
            const messageInput = document.getElementById('messageInput');
            const messageText = messageInput.value.trim();
            
            if (messageText === '' || !activeConversationId) return;
            
            // Clear input
            messageInput.value = '';
            
            // Tambahkan pesan yang dikirim
            addMessageToChat(messageText, false);
            
            // Simulasikan balasan (dalam aplikasi nyata, ini akan datang dari server)
            setTimeout(() => {
                const replyText = generateReply(activeConversationId, messageText);
                addMessageToChat(replyText, true);
            }, 1000);
        }
        
        // Fungsi untuk menghasilkan balasan otomatis
        function generateReply(conversationId, message) {
            const conversation = conversations[conversationId];
            const user = conversation.name;
            
            // Contoh logika balasan sederhana berdasarkan pengguna dan pesan
            if (user === "min9yu_k") {
                if (message.includes('?')) return "Aku akan konfirmasi dulu ya";
                return "Oke, nanti aku kabari lagi!";
            } 
            else if (user === "nisaalj") {
                if (message.toLowerCase().includes('resep')) return "Aku punya resep baru nih, mau aku share?";
                return "Aku mau coba resep lain juga nih";
            }
            else if (user === "leejen_o_423") {
                if (message.toLowerCase().includes('film')) return "Filmnya bagus kan? Aku rekomendasiin yang lain juga deh";
                return "Jangan lupa kasih review setelah nonton ya";
            }
            else if (user === "sherinnnauraa_") {
                return "Ayo kapan-kapan kita kerjain tugas bareng lagi!";
            }
            else if (user === "rellgita") {
                if (message.toLowerCase().includes('bandung')) return "Jangan lupa mampir ke Brownies Amanda ya!";
                return "Jangan lupa foto-foto ya";
            }
            
            return "Pesanmu sudah diterima, terima kasih!";
        }
        
        // Fungsi untuk mendapatkan waktu sekarang
        function getCurrentTime() {
            const now = new Date();
            const hours = now.getHours().toString().padStart(2, '0');
            const minutes = now.getMinutes().toString().padStart(2, '0');
            return `${hours}.${minutes}`;
        }
        
        // Fungsi untuk scroll ke bawah
        function scrollToBottom() {
            const chatMessages = document.getElementById('chatMessages');
            chatMessages.scrollTop = chatMessages.scrollHeight;
        }
        
        // Fungsi untuk modal pesan baru
        function openNewMessageModal() {
            document.getElementById('newMessageModal').style.display = 'flex';
        }
        
        function closeNewMessageModal() {
            document.getElementById('newMessageModal').style.display = 'none';
        }
        
        function selectFriend(friendId) {
            // Hapus seleksi dari semua teman
            document.querySelectorAll('.friend-item').forEach(item => {
                item.style.backgroundColor = 'white';
            });
            
            // Tambahkan seleksi ke teman yang dipilih
            event.currentTarget.style.backgroundColor = '#f0f0f0';
            selectedFriendId = friendId;
        }
        
        function startNewConversation() {
            if (!selectedFriendId) {
                alert('Pilih teman terlebih dahulu');
                return;
            }
            
            // Tutup modal
            closeNewMessageModal();
            
            // Load percakapan dengan teman yang dipilih
            loadConversation(selectedFriendId);
        }
        
        // Event listener untuk input pesan
        document.getElementById('messageInput').addEventListener('keypress', function(e) {
            if (e.key === 'Enter' && !e.shiftKey) {
                e.preventDefault();
                sendMessage();
            }
        });
        
        // Tutup modal ketika klik di luar area modal
        window.addEventListener('click', function(e) {
            if (e.target === document.getElementById('newMessageModal')) {
                closeNewMessageModal();
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
        
        // Inisialisasi: sembunyikan chat content dan tampilkan empty state
        document.addEventListener('DOMContentLoaded', function() {
            document.getElementById('chatContent').style.display = 'none';
        });
    </script>
</body>
</html>