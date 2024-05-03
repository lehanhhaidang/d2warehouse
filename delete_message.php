<?php 
include "db.php";
session_start();
$user_email = $_SESSION['user_mail'];
$query = mysqli_query($conn,"update chats set del_msg='0' where user_mail ='$user_email'");


?>