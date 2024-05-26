<h1 class="text-center">CHI TIẾT ĐỀ XUẤT</h1>
<?php 
if (isset($_REQUEST['idDX'])) {
    $idDX = $_REQUEST['idDX'];   
}
$p->CTDXX("select * from dexuat dx inner join nguyenvatlieu nvl on dx.maNVL = nvl.maNguyenVatlieu where madexuat='$idDX' ");
?>
<form action="" method="post">
<div class="text-center">
    <button style="margin-right:50px;" type="button" class="btn btn-warning" onclick="window.history.back()">Trở lại</button>
    <?php
    if($p->pickColumn("SELECT trangThai FROM dexuat WHERE maDeXuat = '$idDX'") == "Đã duyệt") {
        echo '<button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">Điều phối</button>';
    }
    ?>
</div>
    <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">
            <!-- Modal content-->
                <div class="modal-content" style="width:800px; margin-right:200px;"> 
                    <div class="modal-header">
                    <h4 class="modal-title">ĐIỀU PHỐI XUẤT </h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                <?php
                $p->DPXNVL("SELECT DISTINCT dx.*, nvl.*, k.*, dx.soLuong
                FROM dexuat dx 
                INNER JOIN nguyenvatlieu nvl ON dx.maNVL = nvl.maNguyenVatlieu 
                INNER JOIN longuyenvatlieu lnvl ON nvl.maNguyenVatlieu = lnvl.maNguyenVatlieu
                INNER JOIN kho k ON lnvl.maKho = k.maKho
                WHERE madexuat='$idDX'");
    
                ?>
                
                <label for="input">Tên người nhận: </label>
                <input type="name" class="name input form-control" name="tennguoinhan" placeholder="Nhập tên người nhận" required>
                <label for="date">Ngày xuất</label>
                <input type="date" class="date input form-control" name="date" id="" required>
                </div>

                    <div class="modal-footer">
                        <button type="submit" class="btn btn-success" name="button" value="Xác nhận">Xác nhận</button>
                        <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
                    </div>

            </div>
        
    </div>
  </div>
  </form>
  <?php
    if(isset($_POST['button'])) {
        switch($_POST['button']) {
            case 'Xác nhận':
                {
                    // Lập phiếu xuất
                    $rowCounted = $p->countRow("select * from bieumauxuat");
                    $maBMX = "BMX" . str_pad($rowCounted + 1, 2, "0", STR_PAD_LEFT);
                    $tenNguoiNhan = $_REQUEST['tennguoinhan'];
                    $ngayXuat = $_REQUEST['date'];
                    $insert = $p->InsertUpdate("INSERT INTO bieumauxuat (maBMXuat,maDeXuat, ngayXuat,loaiXuat,tenNguoiNhan,trangThai) VALUES ('$maBMX','$idDX', '$ngayXuat','Nguyên vật liệu','$tenNguoiNhan','Chưa lập phiếu')");
                    if($insert)
                    {      
                        // Thêm mã bản mẫu xuất mới vào các mã lô đã chọn
                        if(isset($_POST['maLoNVL'])) {
                            $maLoNVLs = $_POST['maLoNVL'];
                            foreach($maLoNVLs as $maLoNVL) {
                                $updateBMX = "UPDATE longuyenvatlieu SET maBMXuat = '$maBMX' WHERE maLoNVL = '$maLoNVL'";
                                $p->InsertUpdate($updateBMX);
                                $p->InsertUpdate("UPDATE dexuat set trangThai = 'Đã điều phối' where maDeXuat = '$idDX'");


                            }
                        }
                        echo '<script>';
                        echo 'window.onload = function() { $("#successModal").modal("show"); };';
                        echo '</script>';
    
                    }
                    else
                    {
                        echo '<script>alert("Lập phiếu thất bại")</script>';
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
        <a href="dpx.php" class="btn btn-primary">Xác nhận</a>
      </div>
    </div>
  </div>
</div>