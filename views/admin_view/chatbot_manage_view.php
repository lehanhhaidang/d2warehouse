
<table class="table table-bodered">
    <thead>
        <tr>
            <th>STT</th>
            <th>Câu hỏi</th>
            <th>Trả lời</th>
            <th>Kiểu câu hỏi</th>
            <th>Hành động</th>
        </tr>
    </thead>
    <tbody>
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
        $query = "select * from chats where status = 0";
        $res = mysqli_query($conn, $query);
        $count =1;
        if(mysqli_num_rows($res)==0)
        {
            echo "<tr><td colspan='5'>Hiện tại không có câu hỏi nào cần giải quyết</td></tr>";
        }
        while($result=mysqli_fetch_array($res)){
            $question = $result['user'];
            $id = $result['id'];  
        ?>
        <form action="" method="post">
            <tr>
            <input type="hidden" name="id" id="id" value="<?php echo $id ?>">
            <td><?php echo $count++?></td>
            <td><?php echo $question ?></td>  
            <td><textarea name="reply" id="reply" rows="5" cols="40"></textarea></td>
            <td>
                <select name="action" id="action" class="form-control">
                    <option value="text">Text</option>
                    <option value="query">Query</option>
                </select>
            </td>
            <td>
                <button type="submit" name="submit" class="btn btn-primary" value="Trả lời">Trả lời</button>
                <button type="button" name="delete" class="btn btn-danger" 
                onclick="delete_question(this.value)" value="<?php echo $id ?>">Xóa</button>
            </td>
            </tr>
        </form>
        <?php }?>
    </tbody>
</table>


<?php 
    switch($_POST['submit'])
    {
        case "Trả lời":
            {
                $id = $_POST['id']; // Lấy giá trị id từ form
                
                $answers = mysqli_real_escape_string($conn, $_POST['reply']);

                $query = "select * from chats where status = 0 and id =$id";
                $res= mysqli_query($conn, $query);
                $action = $_POST['action']; // Sử dụng $_POST thay vì $_REQUEST
                
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
                        echo "<script>setTimeout(\"location.href='chatbot_manage.php';\", 100)</script>";
                    }
                }
                else
                {
                    $query1 = "insert into question(question,answer,action) values('$question','$answers','query')";
                    $res1 = mysqli_query($conn, $query1); // Thiếu khởi tạo $res1 ở đây
                    if($res1)
                    {
                        $query2 = "update chats set status = 1 where id = $id";
                        $res2 = mysqli_query($conn, $query2);
                        echo "<script>setTimeout(\"location.href='chatbot_manage.php';\", 100)</script>";
                    }
                }
                break;
            }
    }
?>

