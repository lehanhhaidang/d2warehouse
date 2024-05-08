<?php  
include "db.php";
session_start();
$admin_email = $_SESSION['user_mail'];

$server_time = date("Y-m-d H:i:s");


if(isset($_POST['text'])){
    $userMsg = mysqli_real_escape_string($conn, $_POST["text"]); // Tin nhắn từ người dùng

    $query = mysqli_query($conn, "SELECT * FROM question WHERE question RLIKE '[[:<:]]" . $userMsg . "[[:>:]]'");

    $count = mysqli_num_rows($query);

    if($count == 0) {
        $botMsg = 'Xin chào, tôi có thể giúp gì cho bạn';
        $query4 = mysqli_query($conn, "INSERT INTO chats (user,user_mail, chatbot, action,status, date) VALUES ('$userMsg', '$admin_email','$botMsg', 'text',0 ,'$server_time')");
    } else {
        while($row = mysqli_fetch_array($query)){
            $botMsg = $row['answer'];
            $action = $row['action'];
            $query4 = mysqli_query($conn, "INSERT INTO chats (user,user_mail, chatbot, action,status, date) VALUES ('$userMsg', '$admin_email','$botMsg', '$action',1, '$server_time')");
        }
    }
}
?>
