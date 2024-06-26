<?php 
if (isset($_REQUEST['idDX'])) {
    $idDX = $_REQUEST['idDX'];   
}
?>

<form action="" method="post">
<h1 class="text-center text-primary">THÔNG TIN ĐỀ XUẤT</h1>
<h2 class="text-center">Mã đề xuất: <?php echo $idDX ?></h2>

<p><strong>Mô tả:</strong>
Dựa vào thông tin trong kho, phòng kế hoạch đề xuất kế hoạch nhập kho với danh sách nguyên vật liệu cần thiết như sau:
</p>
</p>

    <div class="listpropose">
        <table class="table table-bordered mx-auto text-center table-hover">
            <thead>
                <tr>
                    <th class="text-center">STT</th>
                    <th class="text-center">Mã nguyên vật liệu</th>
                    <th class="text-center">Tên nguyên vật liệu</th>
                    <th class="text-center">Số lượng trong kho</th>
                    <th class="text-center">Số lượng nhập thêm</th>
                </tr>
            </thead>
            <tbody>
                <?php
                $p->accept_propose("select * from dexuat dx inner join nguyenvatlieu nvl on dx.maNVL = nvl.maNguyenVatlieu where madexuat='$idDX' "); 
                ?>
            </tbody>
        </table>
    </div>
    <div class="button text-center" style="align-items: center;">
        <button type="button" class="btn btn-success" onclick="window.history.back()">Trở lại</button>
        <?php
            if($p->pickColumn("select trangThai from dexuat where maDeXuat = '$idDX'") == "Chờ duyệt")
            {
                echo '<button class="btn btn-warning" type="submit" name="button" value="tuchoi" formaction="">Từ chối</button>
                <button class="btn btn-primary" type="submit" name="button" value="duyet" formaction="">Duyệt phiếu</button>';
                
            }
        ?>
    </div>
</form>
<?php

    switch($_POST['button'])
    {
        case "duyet":
            {
                $link= $p->connect();
                $sql = "UPDATE dexuat set trangThai ='Đã duyệt' where maDeXuat ='$idDX'";
                mysqli_query($link,$sql);
                echo '<script>';
                echo 'window.onload = function() { $("#successModal").modal("show"); };';
                echo '</script>';

            
                break;
            }
        case "tuchoi":
            {
                $link= $p->connect();
                $sql = "UPDATE dexuat set trangThai ='Đã từ chối' where maDeXuat ='$idDX'";
                mysqli_query($link,$sql);
                echo '<script>';
                echo 'window.onload = function() { $("#successModal").modal("show"); };';
                echo '</script>';
                break;
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
        <a href="propose_list_gd.php" class="btn btn-primary">Xác nhận</a>
      </div>
    </div>
  </div>
</div>