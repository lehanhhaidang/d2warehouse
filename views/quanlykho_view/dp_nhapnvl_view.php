<?php 
if (isset($_REQUEST['idDX'])) {
    $idDX = $_REQUEST['idDX'];   
}

$p->CTDX("select * from dexuat dx inner join nguyenvatlieu nvl on dx.maNVL = nvl.maNguyenVatlieu where madexuat='$idDX' ");
?>
<form action="" method="post">
<button style="margin-right:50px;" type="button" class="btn btn-success" onclick="window.history.back()">Trở lại</button>
<button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">Điều phối</button>
    <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">
            <!-- Modal content-->
                <div class="modal-content" style="width:800px; margin-right:200px;"> 
                    <div class="modal-header">
                    <h4 class="modal-title">Modal Header</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                <?php
                $p->DPNNVL("SELECT DISTINCT dx.*, nvl.*, dx.soLuong
                FROM dexuat dx 
                INNER JOIN nguyenvatlieu nvl ON dx.maNVL = nvl.maNguyenVatlieu 
                WHERE madexuat='$idDX'");

                ?>
                <label for="input">Tên người nhận: </label>
                <input type="name" class="name input form-control" name="tennguoigiao" placeholder="Nhập tên người giao" required>
                <label for="date"></label>
                <input type="date" class="date input form-control" name="date" id="" required>
                </div>

                    <div class="modal-footer">
                        <button type="submit" class="btn btn-success" name="button" value="Xác nhận">Xác nhận</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> 
                    </div>

            </div>
            <?php
            $maNVL = $p->pickColumn("select maNVL from dexuat where maDeXuat = '$idDX'");
            
            $donViTinh = $p->pickColumn("select donViTinh from nguyenvatlieu where maNguyenVatLieu = '$maNVL'");
            var_dump($donViTinh);
            ?>

        
    </div>
  </div>
  </form>
  <?php
if(isset($_POST['button'])) {
    switch($_POST['button']) {
        case 'Xác nhận':
            {
                $rowCounted = $p->countRow("select * from bieumaunhap");
                $maBMNhap = "BMN" . str_pad($rowCounted + 1, 2, "0", STR_PAD_LEFT);
                $tenNguoiGiao = $_POST['tennguoigiao'];
                $ngayNhap = $_POST['date'];
                $idDX = $_REQUEST['idDX'];
                $maNVL = $p->pickColumn("select maNVL from dexuat where maDeXuat = '$idDX'");
                $tenNguyenVatLieu = $p->pickColumn("select tenNguyenVatLieu from nguyenvatlieu where maNguyenVatLieu = '$maNVL'");
                $donViTinh = $p->pickColumn("select donViTinh from nguyenvatlieu where maNguyenVatLieu = '$maNVL'");
                $soLuong = $p->pickColumn("select soLuong from dexuat where maNVL = '$maNVL'");
                
                // Lấy các giá trị mã kho từ input ẩn
                $maKhoList = $_POST['maKho'];
                foreach ($maKhoList as $maKho) {
                    $insert = $p->InsertUpdate("INSERT INTO bieumaunhap (maBMNhap, maKho, maDeXuat, ngayNhap, loaiNhap, tenNguoiGiao, trangThai) VALUES ('$maBMNhap', '$maKho', '$idDX', '$ngayNhap', 'Nguyên vật liệu', '$tenNguoiGiao', 'Chưa lập phiếu')");
                    $insert2 = $p->InsertUpdate("INSERT INTO chitietbieumaunhap(maBMNhap,tenSanPham,donViTinh,soLuong) VALUES ('$maBMNhap','$tenNguyenVatLieu','$donViTinh','$soLuong')");
                }
                
                break;
            }   
    }
}

?>

  