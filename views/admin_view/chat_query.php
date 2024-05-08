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

<?php  
$answers = mysqli_real_escape_string($conn, $_POST['reply']);

$query = "select * from chats where status = 0 and id =$id  ";
$res= mysqli_query($conn, $query);
while($result=mysqli_fetch_array($res)){
    $question = $result['user'];
}
if($action=="text")
{
    $query = "insert into question(question,answer,action) values('$question','$answers','text')";
    $res1 = mysqli_query($conn, $query);
    if($res1)
    {
        $query2 = "update chats set status = 1 where id = $id";
        $res2 = mysqli_query($conn, $query2);
        echo "<script>setTimeOut(\"location:href='chatbot_manage.php';\",00)</script>";

    }
}
else
{
    $query1 = "insert into question(question,answer,action) values('$question','$answers','query')";
    if($res1=='1')
    {
        $query2 = "update chats set status = 1 where id = $id";
        $res2 = mysqli_query($conn, $query2);
        echo "<script>setTimeOut(\"location:href='chatbot_manage.php';\",00)</script>";

    }
}
?>