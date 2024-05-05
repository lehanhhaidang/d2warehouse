<?php 
session_start();
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if(isset($_POST['selected_materials'])) {
        $_SESSION['selected_materials'] = $_POST['selected_materials']; // Lưu danh sách sản phẩm đã chọn vào session
    }
}

?>

<form action="" enctype="multipart/form-data" method="post">
<?php
// Khởi tạo mảng để lưu thông tin nguyên vật liệu cần thiết
$nguyenVatLieuCanThiet = array();

if(isset($_SESSION['selected_materials']) && is_array($_SESSION['selected_materials'])) {
    $selectedProducts = $_SESSION['selected_materials'];
    // Tiếp tục xử lý và hiển thị danh sách sản phẩm đã chọn
    echo '<h1 align="center">CÁC SẢN PHẨM ĐÃ CHỌN</h1>';

    echo '<table class="table table-bordered table-hover">';
    echo '<thead>
            <tr>
                <th>Mã nguyên vật liệu</th>
                <th>Tên nguyên vật liệu</th>
                <th>Đơn vị tính</th>
                <th>Số lượng tồn</th>
                <th>Số lượng dự kiến nhập thêm</th>
            </tr>
        </thead>';
    echo '<tbody>';
    foreach ($selectedProducts as $maNguyenVatLieu) {
        // Thực hiện truy vấn để lấy thông tin về sản phẩm từ cơ sở dữ liệu
        $link = $p->connect();
        $sql = "SELECT * FROM nguyenvatlieu WHERE maNguyenVatLieu = '$maNguyenVatLieu'";
        $result = mysqli_query($link, $sql); // Sử dụng MySQLi thay vì MySQL
        if ($result && mysqli_num_rows($result) > 0) {
            $row = mysqli_fetch_assoc($result);
            $maNguyenVatLieu = $row['maNguyenVatLieu'];
            $tenNguyenVatLieu = $row['tenNguyenVatLieu'];
            $donViTinh = $row['donViTinh'];
            $soLuongTonnvl = $row['soLuongTonnvl'];
            echo '<tr>
                    <td>'.$maNguyenVatLieu.'</td>
                    <td>'.$tenNguyenVatLieu.'</td>
                    <td>'.$donViTinh.'</td>
                    <td>'.$soLuongTonnvl.'</td>
                    <td><input type="number" name="expected_quantity['.$maNguyenVatLieu.']" value="0"></td>
                </tr>';
        }
    }
}
    echo '</tbody>';
    echo '</table>';
    echo '<div class="text-center">
    <br>
    <button type="submit" class="btn btn-primary" name="gui" value="Gửi đề xuất">Gửi đề xuất</button>
    </div>
    <br><br>';
?>
<?php
if(isset($_POST['gui'])) {
  // Kết nối đến cơ sở dữ liệu
  $link = $p->connect();

  // Lấy thông tin về mã đề xuất mới
  $result_max_maDeXuat = mysqli_query($link, "SELECT MAX(CAST(SUBSTRING(maDeXuat, 3) AS UNSIGNED)) AS max_maDeXuat FROM dexuat"); // Sử dụng MySQLi thay vì MySQL
  $row_max_maDeXuat = mysqli_fetch_assoc($result_max_maDeXuat);
  $max_maDeXuat = $row_max_maDeXuat['max_maDeXuat'];
  $next_maDeXuat = 'DX' . str_pad($max_maDeXuat + 1, 2, '0', STR_PAD_LEFT); // Tạo mã mới cho maDeXuat
  // Tên đề xuất mặc định
  $tenDeXuat = "Đề xuất nhập nguyên vật liệu";
  // Lặp qua các sản phẩm đã chọn
  foreach ($_POST['expected_quantity'] as $maNguyenVatLieu => $soLuong) {

      if($soLuong>0)
      {
          if($result_insert = mysqli_query($link, "INSERT INTO dexuat (maDeXuat, tenDeXuat, maNVL, soLuong, trangThai)
          VALUES ('$next_maDeXuat', '$tenDeXuat', '$maNguyenVatLieu', '$soLuong', 'Chờ duyệt')")) {
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


?>
<!-- modal -->
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
        <a href="propose_importMaterials.php" class="btn btn-primary">Xác nhận</a>
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
