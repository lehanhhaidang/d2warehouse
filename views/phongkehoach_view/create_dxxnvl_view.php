
<?php 
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if(isset($_POST['selected_products'])) {
        $_SESSION['selected_products'] = $_POST['selected_products']; // Lưu danh sách sản phẩm đã chọn vào session
    }
}

?>

<form action="" enctype="multipart/form-data" method="post">
<?php
// Khởi tạo mảng để lưu thông tin nguyên vật liệu cần thiết
$nguyenVatLieuCanThiet = array();

if(isset($_SESSION['selected_products']) && is_array($_SESSION['selected_products'])) {
    $selectedProducts = $_SESSION['selected_products'];
    // Tiếp tục xử lý và hiển thị danh sách sản phẩm đã chọn
    echo '<h1 align="center">CÁC SẢN PHẨM ĐÃ CHỌN</h1>';

    echo '<table class="table table-bordered table-hover">';
    echo '<thead>
            <tr>
                <th>Mã thành phẩm</th>
                <th>Tên thành phẩm</th>
                <th>Đơn vị tính</th>
                <th>Số lượng tồn</th>
                <th>Số lượng dự kiến sản xuất</th>
            </tr>
        </thead>';
    echo '<tbody>';
    foreach ($selectedProducts as $maThanhPham) {
        // Thực hiện truy vấn để lấy thông tin về sản phẩm từ cơ sở dữ liệu
        $link = $p->connect();
        $sql = "SELECT * FROM thanhpham WHERE maThanhPham = '$maThanhPham'";
        $result = mysqli_query($link, $sql); // Sử dụng MySQLi thay vì MySQL
        if ($result && mysqli_num_rows($result) > 0) {
            $row = mysqli_fetch_assoc($result); // Sử dụng mysqli_fetch_assoc thay vì mysql_fetch_assoc
            $maThanhPham = $row['maThanhPham'];
            $tenThanhPham = $row['tenThanhPham'];
            $donViTinh = $row['donViTinh'];
            $soLuongTon = $row['soLuongTon'];
            echo '<tr>
                    <td>'.$maThanhPham.'</td>
                    <td>'.$tenThanhPham.'</td>
                    <td>'.$donViTinh.'</td>
                    <td>'.$soLuongTon.'</td>
                    <td><input type="number" name="expected_quantity['.$maThanhPham.']" value="0"></td>
                </tr>';
        }
    }
}
    echo '</tbody>';
    echo '</table>';
    echo '<div class="text-center">
    <br>
    <button type="submit" class="btn btn-primary" name="tinhnvl" value="Tinh toan">Tinh toan</button>
    </div>
    <br><br>';
?>
<?php
if(isset($_POST['tinhnvl']))
{
    $expectedQuantities= $_POST['expected_quantity'];
    echo '<h1 align="center">NGUYÊN VẬT LIỆU CẦN THIẾT</h1>';
    echo '<table class="table table-bordered table-hover">';
    echo '<thead>
            <tr>
                <th>Mã NVL</th>
                <th>Tên NVL</th>
                <th>Đơn vị tính</th>
                <th>Số lượng cần</th>
            </tr>
        </thead>';
    echo '<tbody>';
    foreach ($expectedQuantities as $maThanhPham => $soLuongDuKien) {
        // Thực hiện truy vấn để lấy thông tin về nguyên vật liệu cần thiết từ cơ sở dữ liệu
        $sql = "SELECT nvl.*, dm.soLuong * $soLuongDuKien AS soLuongCan
                FROM nguyenvatlieu AS nvl
                JOIN dinhmucnvl AS dm ON nvl.maNguyenVatLieu = dm.maNguyenVatLieu
                WHERE dm.maThanhPham = '$maThanhPham'";
        $link = $p->connect();
        $result = mysqli_query($link, $sql); // Sử dụng MySQLi thay vì MySQL
        if ($result && mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) { // Sử dụng mysqli_fetch_assoc thay vì mysql_fetch_assoc
                $maNguyenVatLieu = $row['maNguyenVatLieu'];
                $tenNguyenVatLieu = $row['tenNguyenVatLieu'];
                $donViTinh = $row['donViTinh'];
                $soLuongCan = $row['soLuongCan'];
                
                // Lưu thông tin vào mảng
                $nguyenVatLieuCanThiet[] = array(
                    'maNguyenVatLieu'

 => $maNguyenVatLieu,
                    'soLuongCan' => $soLuongCan
                );
                
                echo '<tr>
                        <td>'.$maNguyenVatLieu.'</td>
                        <td>'.$tenNguyenVatLieu.'</td>
                        <td>'.$donViTinh.'</td>
                        <td>'.$soLuongCan.'</td>
                    </tr>';
            }
        }
    }
    echo '</tbody>';
    echo'</table>'; 
    echo '<div class="text-center">
    <input type="submit" class="btn btn-success" name="insert_dexuat" value="Insert to Dexuat"></input>   
    </div>';

    // Lưu thông tin vào session
    $_SESSION['nguyenVatLieuCanThiet'] = $nguyenVatLieuCanThiet;
}
?>
<?php
if(isset($_POST['insert_dexuat']))
{
    // Lấy thông tin từ session
    $nguyenVatLieuCanThiet = $_SESSION['nguyenVatLieuCanThiet'];
    
    // Kết nối CSDL
    $link = $p->connect();
    
    // Lấy mã đề xuất lớn nhất từ bảng dexuat
    $result_max_maDeXuat = mysqli_query($link, "SELECT MAX(CAST(SUBSTRING(maDeXuat, 3) AS UNSIGNED)) AS max_maDeXuat FROM dexuat"); // Sử dụng MySQLi thay vì MySQL
    $row_max_maDeXuat = mysqli_fetch_assoc($result_max_maDeXuat); // Sử dụng mysqli_fetch_assoc thay vì mysql_fetch_assoc
    $max_maDeXuat = $row_max_maDeXuat['max_maDeXuat'];
    $next_maDeXuat = 'DX' . str_pad($max_maDeXuat + 1, 2, '0', STR_PAD_LEFT); // Tạo mã mới cho maDeXuat
    $tenDeXuat = "Đề xuất xuất nguyên vật liệu cho sản xuất"; // Tên đề xuất mặc định
    
    // Thực hiện lệnh INSERT vào bảng dexuat
    foreach ($nguyenVatLieuCanThiet as $nvl) {
        $maNVL = $nvl['maNguyenVatLieu'];
        $soLuong = $nvl['soLuongCan'];
        $trangThai = "Chờ duyệt"; // Giả sử trạng thái mặc định là "Chưa xử lý"
        // Thực hiện INSERT với các giá trị lấy từ mảng $nvl và mã đề xuất mới
        if($soLuong>0)
        {
            if($result_insert = mysqli_query($link, "INSERT INTO dexuat (maDeXuat, tenDeXuat, maNVL, soLuong, trangThai) VALUES ('$next_maDeXuat', '$tenDeXuat', '$maNVL', $soLuong, '$trangThai')")==1)
            {
                echo '<script>';
                echo 'window.onload = function() { $("#successModal").modal("show"); };';
                echo '</script>';
            }
            else
            {
                echo '<script>';
                echo 'window.onload = function() { $("#failureModal").modal("show"); };';
                echo '</script>';
            }
    
        }
        else
        {
            echo '<script>';
            echo 'window.onload = function() { $("#failureModal_num").modal("show"); };';
            echo '</script>';
        }

    }



}
    // Hiển thị modal Bootstrap và chuyển hướng người dùng sau khi INSERT thành công
?>

<!-- Modal -->
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
        Thêm đề xuất thành công!
      </div>
      <div class="modal-footer">
        <a href="propose_manufacture.php" class="btn btn-primary">Xác nhận</a>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="failureModal" tabindex="-1" role="dialog" aria-labelledby="successModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="successModalLabel">Thông báo</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        Thêm đề xuất thất bại!
      </div>
      <div class="modal-footer">
        <a href="" class="btn btn-primary">Xác nhận</a>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="failureModal_num" tabindex="-1" role="dialog" aria-labelledby="successModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="successModalLabel">Thông báo</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        Thêm đề xuất thất bại!
        <br>
        Số lượng phải lớn hơn 0!
      </div>
      <div class="modal-footer">
        <a href="" class="btn btn-primary">Xác nhận</a>
      </div>
    </div>
  </div>
</div>
</form>
