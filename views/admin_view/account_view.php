<?php

session_start();

if(isset($_REQUEST['id']))
{
    $id = $_REQUEST['id'];
}

?>


<form action="" method="post">
<div class="button">
    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">Thêm tài khoản</button>
</div>
<br>
<table class="table table-bordered">
    <thead>
        <tr>
            <th class="text-center">Tên người dùng</th>
            <th class="text-center">Email</th>
            <th class="text-center">Số điện thoại</th>
            <th class="text-center">Địa chỉ</th>
            <th class="text-center">Chức vụ</th>
            <th class="text-center">Trạng thái</th>
            <th class="text-center">Tùy chọn</th>
        </tr>
    </thead>
        <tbody>
            <input type="hidden" name="idchon" id="idchon" value="<?php echo $id ?>"></td>
            <td><input name="txtten" type="text" id="txtten" class="input form-control" value="<?php echo $p->pickColumn("select hoten from taikhoan where id_acc= '$id' limit 1 ");?>"></td>
            <td><input name="txtemail" type="text" id="txtemail" class="input form-control" value="<?php echo $p->pickColumn("select email from taikhoan where id_acc= '$id' limit 1 ");?>"></td>
            <td><input name="txtsdt" type="text" id="txtsdt" class="input form-control" value="<?php echo $p->pickColumn("select dienthoai from taikhoan where id_acc= '$id' limit 1 ");?>"></td>
            <td><input name="txtdiachi" type="text" id="txtdiachi" class="input form-control" value="<?php echo $p->pickColumn("select diachi from taikhoan where id_acc= '$id' limit 1 ");?>"></td>
            <td>
                <select name="txtchucvu" id="txtchucvu" class="form-control">
                    <?php
                    // Mảng ánh xạ giá trị role với tên tương ứng
                    $role_names = array(
                        "nhanvienkho" => "Nhân viên kho",
                        "quanlykho" => "Quản lý kho",
                        "nhanvienkiemke" => "Nhân viên kiểm kê",
                        "giamdoc" => "Giám đốc",
                        "nvpkehoach" => "Nhân viên kế hoạch"
                        // Thêm các vai trò khác nếu cần
                    );

                    // Lấy vai trò của tài khoản hiện tại
                    $current_role = $p->pickColumn("SELECT role FROM taikhoan WHERE id_acc = '$id' LIMIT 1");

                    // Thực hiện truy vấn SQL để lấy danh sách các vai trò
                    $sql = "SELECT DISTINCT role FROM taikhoan";
                    $result = mysqli_query($p->connect(), $sql);

                    // Duyệt qua kết quả và hiển thị các vai trò trong dropdown
                    while ($row = mysqli_fetch_array($result)) {
                        $role = $row['role'];
                        // Kiểm tra xem vai trò có trong mảng ánh xạ không và hiển thị tên tương ứng
                        $role_name = isset($role_names[$role]) ? $role_names[$role] : $role;
                        $selected = ($role == $current_role) ? 'selected' : ''; // Chọn vai trò hiện tại
                        echo '<option value="' . $role . '" ' . $selected . '>' . $role_name . '</option>';
                    }
                    ?>
                </select>
            </td>

            <td>
                <select name="txttrangthai" id="txttrangthai" class="form-control">
                    <option value="hoatdong" <?php echo ($current_status == 'hoatdong') ? 'selected' : ''; ?>>Hoạt động</option>
                    <option value="khonghoatdong" <?php echo ($current_status == 'khonghoatdong') ? 'selected' : ''; ?>>Ngưng hoạt động</option>
                </select>
            </td>
            <td>
                <button type="submit" class="btn btn-success" name="button" value="Sửa">Sửa</button>
                <button type="submit" class="btn btn-danger" name="button" value="Xóa">Xóa</button>
                
            </td>



            

        </tbody>
</table>


  <?php
    $p->list_user("SELECT * FROM taikhoan");
?>

<p?php

?>
<div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">
            <!-- Modal content-->
                <div class="modal-content" style="width:800px; margin-right:200px;"> 
                    <div class="modal-header">
                    <h4 class="modal-title">Thêm tài khoản</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="ho_ten">Họ và tên:</label>
                        <input type="text" class="form-control" id="ho_ten" name="ho_ten">
                    </div>
                    <div class="form-group">
                        <label for="email">Email:</label>
                        <input type="email" class="form-control" id="email" name="email">
                    </div>
                    <div class="form-group">
                        <label for="mat_khau">Mật khẩu:</label>
                        <input type="password" class="form-control" id="mat_khau" name="mat_khau">
                    </div>
                    <div class="form-group">
                        <label for="so_dien_thoai">Số điện thoại:</label>
                        <input type="tel" class="form-control" id="so_dien_thoai" name="so_dien_thoai">
                    </div>
                    <div class="form-group">
                        <label for="dia_chi">Địa chỉ:</label>
                        <input type="text" class="form-control" id="dia_chi" name="dia_chi">
                    </div>
                    <div class="form-group">
                        <label for="hinh_dai_dien">Tải lên hình đại diện:</label>
                        <input type="file" class="form-control-file" id="hinh_dai_dien" name="hinh_dai_dien">
                    </div>
                    <div class="form-group">
                        <label for="vai_tro">Vai trò:</label>
                        <select class="form-control" id="vai_tro" name="vai_tro">
                            <option value="">Chọn vai trò</option> <!-- Tùy chọn mặc định -->
                            <?php
                            $link = $p->connect();
                            // Mảng ánh xạ giá trị role với tên tương ứng
                            $role_names = array(
                                "nhanvienkho" => "Nhân viên kho",
                                "quanlykho" => "Quản lý kho",
                                "nhanvienkiemke" => "Nhân viên kiểm kê",
                                "giamdoc" => "Giám đốc",
                                "nvpkehoach" => "Nhân viên kế hoạch"
                                // Thêm các vai trò khác nếu cần
                            );

                            // Thực hiện truy vấn SQL để lấy danh sách các vai trò
                            $sql = "SELECT DISTINCT role FROM taikhoan";
                            $result = mysqli_query($link, $sql);

                            // Duyệt qua kết quả và hiển thị các vai trò trong menu dropdown
                            while ($row = mysqli_fetch_array($result)) {
                                $role = $row['role'];
                                // Kiểm tra xem vai trò có trong mảng ánh xạ không và hiển thị tên tương ứng
                                $role_name = isset($role_names[$role]) ? $role_names[$role] : $role;
                                echo '<option value="' . $role . '">' . $role_name . '</option>';
                            }
                            ?>
                        </select>
                    </div>
                </div>


                <div class="modal-footer">
                    <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button> 
                    <button type="submit" class="btn btn-success" name="button" value="Xác nhận">Xác nhận</button>
                </div>

            </div>     
    </div>
  </div>
  <?php
    
  ?>

  </form>




<?php
   if(isset($_POST['button']))
   {
    switch($_POST['button']){
        case 'Xác nhận':
            {
                $id_acc = $p->countRow("SELECT * FROM taikhoan") +1 ;
                $ho_ten = $_POST['ho_ten'];
                $email = $_POST['email'];
                $mat_khau = md5($_POST['mat_khau']);
                $so_dien_thoai = $_POST['so_dien_thoai'];
                $dia_chi = $_POST['dia_chi'];
                $vai_tro = $_POST['vai_tro'];
                $hinh_dai_dien = $_POST['hinh_dai_dien'];
                $trangThai = "hoatdong";
                $name = $_FILES['hinh_dai_dien"']['name'];
				$type = $_FILES['hinh_dai_dien"']['type'];
				$tmp_name = $_FILES['hinh_dai_dien"']['tmp_name'];
                // if($type =='image/jpeg')
				// 	{
				// 		$name = time()."_".$name;
				// 		if($p->uphinh($name,"../../uploads/",$tmp_name)==1)
				// 		{
                //             $query = "INSERT INTO `taikhoan`( `hoten`, `email`, `matkhau`, `dienthoai`, `diachi`, `role`, `hinhdaidien`) 
                //               VALUES ('$ho_ten','$email','$mat_khau','$so_dien_thoai','$dia_chi','$vai_tro','$name')";
				// 			if($p->InsertUpdate($query)==1)
				// 			{
				// 				echo '<script>alert("Them thanh cong")</script>';
				// 				echo '<script>window.location="../admin/"</script>';
				// 			}
				// 			else
				// 			{
				// 				echo "Them khong thanh cong";
				// 			}
				// 		}
				// 		else
				// 		{
				// 			echo "Up hinh that bai";
				// 		}
				// 	}
				// 	else
				// 	{
				// 		echo "Vui long chon dung dinh dang";
						
				// 	}

                
        
                // if (mysqli_query($p->connect(), $query)) {
                //     echo '<script>';
                //     echo 'window.onload = function() { $("#successModal").modal("show"); };';
                //     echo '</script>';
                // }
                function user_register($data)
                {
            
                    $username = $data['hoten'];
                    $user_email = $data['email'];
                    $user_password = md5($data['pass']);
                    $user_password2 = md5($data['pass2']);
                    $user_mobile = $data['sdt'];
                    $user_address = $data['diachi'];
                    $user_roles = $data['user_role'];
            
            
                    $user_check = "SELECT * FROM `taikhoan` WHERE email ='$user_email'";
            
                    $mysqli_result = mysqli_query($this->connection, $user_check);
            
                    $row = mysqli_num_rows($mysqli_result);
                    if(empty($username) || empty($user_email) || empty($user_password) || empty($user_password2)){
                        $msg = 3;
                        return $msg;
                    }else{
                        if($user_password !== $user_password2){
                            $msg = 4;
                            return $msg;
                        }else{
                            if ($row == 1) {
                                $msg = 2;
                                return $msg;
                            } else {
                                $mail = new PHPMailer(true);
                                try {
                                    $random = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
                                    $token = substr(str_shuffle($random), 0, 30);
                                    $query = "INSERT INTO `taikhoan`( `hoten`, `email`, `matkhau`, `dienthoai`, `diachi`,`token`,`role`) VALUES ('$username','$user_email','$user_password','$user_mobile','$user_address','$token','$user_roles')";
                                    mysqli_query($this->connection, $query);
                                    $mail->SMTPOptions = array(
                                        'ssl' => array(
                                            'verify_peer' => false,
                                            'verify_peer_name' => false,
                                            'allow_self_signed' => true
                                        )
                                    );
                                    //Server settings
                                    $mail->SMTPDebug = 0;                      // Enable verbose debug output
                                    $mail->isSMTP();                                            // Send using SMTP
                                    $mail->Host       = 'smtp.gmail.com';                     // Set the SMTP server to send through
                                    $mail->SMTPAuth   = true;                                   // Enable SMTP authentication
                                    $mail->Username   = 'nongsanquenha20@gmail.com';                     // SMTP username
                                    $mail->Password   = 'xkku fkst ivpb fjva';                               // SMTP password
                                    $mail->SMTPSecure = 'tls';         // Enable TLS encryption; `PHPMailer::ENCRYPTION_SMTPS` also accepted
                                    $mail->Port       = 587;                                    // TCP port to connect to
                                    $mail->CharSet = 'UTF-8';
                                    //Recipients
                                    $mail->setFrom('nongsanquenha20@gmail.com', 'Nông sản quê nhà');
            $mail->addAddress($user_email, $username);     // Add a recipient
                    
                                    // Content
                                    $mail->isHTML(true);                                  // Set email format to HTML
                                    $mail->Subject = '<nongsanquenha> BẠN CÓ MÃ XÁC NHẬN EMAIL';
                                    $mail->Body    = '
                                    Đây là email xác nhận tài khoản của website NÔNG SẢN QUÊ NHÀ<br><br>
                    
                                    Vui lòng nhấn vào liên kết dưới đây để xác nhận tài khoản của bạn:<br>
                                    <a class="btn btn-success" href="http://localhost/nongsan/xacnhan_email.php?email=' . $user_email . '&token=' . $token . '">Xác nhận tài khoản của bạn tại đây.</a><br><br>
                                    
                                    Cảm ơn bạn!<br>
                                    Đội ngũ NÔNG SẢN QUÊ NHÀ
                                    ';
                    
                                    $mail->send();
                                    $msg = 1;
                                    return $msg;
                                } catch (Exception $e) {
                                    echo "Đã xảy ra lỗi! Vui lòng thử lại";
                                }
            
                                // if (mysqli_query($this->connection, $query)) {
                                //     $msg = "Đăng ký thành công!!";
                                //     return $msg;
                                // }
                            }
                        }
                    }
                }


                break;
            }
            case "Xóa":
                {
                    $layid = $_REQUEST['idchon'];
                    if($layid>0)
                    {
                            if($p->InsertUpdate("delete from taikhoan where id_acc ='$layid'limit 1")==1)
                            {
                                echo '<script>';
                                echo 'window.onload = function() { $("#successModal").modal("show"); };';
                                echo '</script>';
                            }
                            else
                        {
                            echo "Xoa khong thanh cong";
                        }              
                    }
                    else
                    {
                        echo "";
                    }
                    
                    break;
                }
                case "Sửa":
                    {
                        $ten = $_REQUEST['txtten'];
                        $email = $_REQUEST['txtemail'];
                        $sdt = $_REQUEST['txtsdt'];
                        $diachi = $_REQUEST['txtdiachi'];
                        $chucvu = $_REQUEST['txtchucvu'];
                        $trangthai = $_REQUEST['txttrangthai'];

                        $layid = $_REQUEST['idchon'];
                        if($layid >0)
                        {
                            if($p->InsertUpdate("UPDATE taikhoan SET hoten = '$ten', email = '$email', dienthoai = '$sdt', diachi = '$diachi', role = '$chucvu', trangthai = '$trangthai' WHERE id_acc = '$layid'")==1)
                            {
                                echo '<script>';
                                echo 'window.onload = function() { $("#successModal").modal("show"); };';
                                echo '</script>';
                            }
                            else
                            {
                                echo "Sua khong thanh cong";
                            }
                        }
                        else
                        {
                            echo "Chon san pham can sua";
                        }
                        
                        break;
                    }
                    
        }
   }
?>


<div class="modal fade" id="successModal" tabindex="-1" role="dialog" aria-labelledby="successModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="successModalLabel">Thông báo</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        Thành công!
      </div>
      <div class="modal-footer">
        <a href="account.php" class="btn btn-primary">Xác nhận</a>
      </div>
    </div>
  </div>
</div>