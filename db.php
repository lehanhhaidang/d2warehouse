<?php

$servername = "localhost";
$username = "root";
$password ="";
$dbname ="chatbot_d2warehouse";

$conn = new mysqli($servername,$username,$password,$dbname);

if(!$conn)
{
    echo'Connect that bai';
}
else
{
    #echo 'Connected';
    $conn->set_charset("utf8");
}

?>