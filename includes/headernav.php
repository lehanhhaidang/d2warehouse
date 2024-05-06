<?php include "db.php"; ?>
<nav class="navbar header-navbar pcoded-header">
               <div class="navbar-wrapper">
                   <div class="navbar-logo">
                       <a class="mobile-menu" id="mobile-collapse" href="#!">
                           <i class="ti-menu"></i>
                       </a>
                       <div class="mobile-search">
                           <div class="header-search">
                               <div class="main-search morphsearch-search">
                                   <div class="input-group">
                                       <span class="input-group-addon search-close"><i class="ti-close"></i></span>
                                       <input type="text" class="form-control" placeholder="Enter Keyword">
                                       <span class="input-group-addon search-btn"><i class="ti-search"></i></span>
                                   </div>
                               </div>
                           </div>
                       </div>
                       <a href="index.php">

                      <?php 
                       $obj=new adminback();
                       $logo_info = $obj->display_logo();

                       $logo = mysqli_fetch_assoc($logo_info);

                       ?>
                           <img width="50" height="50" src="uploads/<?php echo $logo['img']; ?>" alt="Theme-Logo" /> 
                       </a>
                       <a class="mobile-options">
                           <i class="ti-more"></i>
                       </a>
                   </div>

                   <div class="navbar-container container-fluid">
                       <ul class="nav-left">
                           <li>
                               <div class="sidebar_toggle"><a href="javascript:void(0)"><i class="ti-menu"></i></a></div>
                           </li>
                           <li class="header-search">
                               <div class="main-search orphsearch-search">
                                   <div class="input-group">
                                       <span class="input-group-addon search-close"><i class="ti-close"></i></span>
                                       <input type="text" class="form-control">
                                       <span class="input-group-addon search-btn"><i class="ti-search"></i></span>
                                   </div>
                               </div>
                           </li>
                           <li>
                               <a href="#!" onclick="javascript:toggleFullScreen()">
                                   <i class="ti-fullscreen"></i>
                               </a>
                           </li>
                       </ul>
                       
                       <ul class="nav-right">
                       <li class="chat" style="margin-top: 8px;">
                    <i class="ti-comment" style="color: white; font-size: large;" onclick="toggleChatbox()"></i>                        
                        <span id="ref">
                            <div class="chatbox">
                                <div class="chatbox__header">
                                    <h1>Chat support!</h1>
                                </div>
                                <div class="messages">
                                    <?php
                                    session_start();
                                    $p = new nhanvienkho();
                                    $_SESSION['user_mail'] = $admin_email;
                                    $query = "SELECT * FROM chats WHERE user_mail = '$admin_email' and del_msg ='1' ORDER BY date ASC"; // Sắp xếp tin nhắn từ dưới lên trên
                                    $res = mysqli_query($conn, $query);
                                    while ($data = mysqli_fetch_array($res)) {
                                        $user = $data['user'];
                                        $chatbot = $data['chatbot'];
                                        $date = $data['date'];
                                        $action = $data['action'];
                                        

                                        $child1 = date('g:i:a', strtotime($date));
                                        $child2 = date('n.j.Y', strtotime($date));
                                    ?>
                                        <?php if ($action == 'text') { ?>
                                            <div class="content-chat-me">
                                                <p><?php echo $user; ?></p>
                                                <span class="time-right"><?php echo $date; ?></span>
                                                </div>
                                                <div class="content-chat">
                                                <p><?php echo $chatbot; ?></p>
                                                <span class="time-left"><?php echo $date; ?></span>
                                                </div>
                                            
                                        <?php } else { ?>
                                
                                            <div class="content-chat-me">
                                                <p><?php echo $user; ?></p>
                                                <span class="time-right"><?php echo $date; ?></span>
                                                </div>
                                                <div class="content-chat">
                                                <p><?php echo eval($chatbot); ?></p>
                                                <span class="time-left"><?php echo $date; ?></span>
                                                </div>
                                        <?php } ?>
                                    <?php } ?>
                                </div>
                                <div class="input-group mb-2">
                                    <input type="text" placeholder="Nhập câu hỏi" required class="sendmess" id="msg" onkeypress="handleKeyPress(event)">
                                    <div class="input-group-append">
                                        <button class="btn btn-primary" type="button" onclick="delete_message()">Clear Chat</button>
                                        <button class="btn btn-outline-secondary" type="button" onclick="send()">Send</button>
                                    </div>
                                </div>
                            </div>
                        </span>
                    </li>
                           <li class="header-notification">
                               <a href="#!">
                                   <i class="ti-bell"></i>
                                   <span class="badge bg-c-pink"></span>
                               </a>
                               <ul class="show-notification">
                                   <li>
                                       <h6>Notifications</h6>
                                       <label class="label label-danger">New</label>
                                   </li>
                                   <li>
                                       <div class="media">
                                           <img class="d-flex align-self-center img-radius" src="assets/images/avatar-2.jpg" alt="Generic placeholder image">
                                           <div class="media-body">
                                               <h5 class="notification-user">John Doe</h5>
                                               <p class="notification-msg">Lorem ipsum dolor sit amet, consectetuer elit.</p>
                                               <span class="notification-time">30 minutes ago</span>
                                           </div>
                                       </div>
                                   </li>
                                   <li>
                                       <div class="media">
                                           <img class="d-flex align-self-center img-radius" src="assets/images/avatar-4.jpg" alt="Generic placeholder image">
                                           <div class="media-body">
                                               <h5 class="notification-user">Joseph William</h5>
                                               <p class="notification-msg">Lorem ipsum dolor sit amet, consectetuer elit.</p>
                                               <span class="notification-time">30 minutes ago</span>
                                           </div>
                                       </div>
                                   </li>
                                   <li>
                                       <div class="media">
                                           <img class="d-flex align-self-center img-radius" src="assets/images/avatar-4.jpg" alt="Generic placeholder image">
                                           <div class="media-body">
                                               <h5 class="notification-user">Sara Soudein</h5>
                                               <p class="notification-msg">Lorem ipsum dolor sit amet, consectetuer elit.</p>
                                               <span class="notification-time">30 minutes ago</span>
                                           </div>
                                       </div>
                                   </li>
                               </ul>
                           </li>
                           
                           <li class="user-profile header-notification">
                               <a href="#!">
                                   <img src="assets/images/avatar-2.jpg" class="img-radius" alt="User-Profile-Image">
                                   <span> <?php echo $admin_email ?> </span>
                                   <i class="ti-angle-down"></i>
                               </a>
                               <ul class="show-notification profile-notification">         
                                   <li>
                                       <a href="?adminLogout=logout">
                                       <i class="ti-layout-sidebar-left"></i> Logout
                                   </a>
                                   </li>
                               </ul>
                           </li>
                           
                       </ul>
                   </div>
               </div>
           </nav>


<style>
.chatbox {
    display: none;
    position: fixed;
    /* bottom: 20px; */
    right: 200px;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    width: 600px;
    max-height: 500px;
    overflow-y: auto;
    z-index: 9999;
    transition: all 0.3s ease;
}

.chatbox__header {
    background-color: #4267b2;
    color: #fff;
    padding: 10px;
    border-top-left-radius: 8px;
    border-top-right-radius: 8px;
    font-size: 18px;
    text-align: center;
}

.messages {
    padding: 10px;
    display: flex;
    flex-direction: column;
    justify-content: flex-start;
    align-items: flex-start;
    width: 100%;
    min-height: 45vh;
    max-height: 45vh;
    overflow-y: auto;
}

.messages p {
    margin: 5px 0;
}

.input-group {
    margin: 10px;
    display: flex;
    align-items: center;
}

.input-group input[type="text"] {
    flex: 1;
    border: none;
    outline: none;
    padding: 10px;
    border-radius: 20px;
    margin-right: 10px;
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
    height: 40px;
}

.input-group-append button {
    background-color: #4267b2;
    color: #fff;
    border: none;
    outline: none;
    padding: 10px 20px;
    cursor: pointer;
    border-radius: 20px;
    transition: background-color 0.3s ease;
}

.input-group-append button:hover {
    background-color: #3b5998;
}

.content-chat,
.content-chat-me {
    font-size: medium;
    width: 60%;
    padding: 5px;
    margin: 5px 0;
    border-radius: 5px;
}

.content-chat {
    background-color: #f4f4f4;
    color: #333;
}

.content-chat-me {
    background-color: #4267b2;
    color: #fff;
    align-self: flex-end;
    margin-left: auto;
}

.text-message {
    border-radius: 2px;
    border: 2px solid #D9D9D9;
    width: 70%;
    min-height: 5vh;
}
.show-chatbox {
    display: block;
    /* Thêm hiệu ứng transition */
    transition: all 0.3s ease;
}

.btn-send {
    width: 20%;
    background-color: #3EAEF4;
    border-color: #3EAEF4;
    outline: none;
    text-transform: uppercase;
    border-radius: 5px;
}

.text-message:focus {
    outline: none;
}



</style>

<script type="text/javascript">
 function send() {
    
    var text = $('.sendmess').val().toLowerCase();
    console.log("userMsg:", text);
    $.ajax({
        type: "post",
        url: "mysearch.php",
        data: { text: text },
        success: function(data) {
            // Thêm tin nhắn mới vào cuối danh sách tin nhắn
            $('.messages').append(data);
            // Xóa nội dung trong ô nhập
            $('.sendmess').val('');
            // Tải lại phần tử có id là #ref để cập nhật tin nhắn
            $('#ref').load(' #ref', function() {
                // Hiển thị khung chat sau khi tải lại nội dung
                $('.chatbox').show();
                // Cuộn xuống tin nhắn mới
                $('.messages').scrollTop($('.messages')[0].scrollHeight);
            });
        }
    });
}




function handleKeyPress(event) {
    if (event.keyCode === 13) { // Kiểm tra nếu phím nhấn là Enter
        send(); // Gửi tin nhắn khi nhấn Enter
    }
}

function digitsOnly(input) {
    var regex = /[^a-z ?]/gi;
    input.value = input.value.replace(regex, "");
}

function delete_message() {
    $.ajax({
        type: "post",
        url: "delete_message.php",
        success: function(data) {
            // Xóa toàn bộ tin nhắn trong danh sách
            $('.messages').empty();
        }

    });
}



// Hàm để ẩn hoặc hiển thị khung chat khi bấm vào biểu tượng robot
function toggleChatbox() {
    const chatbox = document.querySelector(".chatbox");
    const isChatboxVisible = chatbox.classList.contains("show-chatbox");
    if (isChatboxVisible) {
        chatbox.classList.remove("show-chatbox");
    } else {
        chatbox.classList.add("show-chatbox");
    }
}
// Hàm để ẩn hoặc hiển thị khung chat khi bấm vào biểu tượng robot
function toggleChatbox() {
    const chatbox = document.querySelector(".chatbox");
    const isChatboxVisible = chatbox.style.display === "block";
    if (isChatboxVisible) {
        chatbox.style.display = "none";
    } else {
        chatbox.style.display = "block";
    }
}
</script>