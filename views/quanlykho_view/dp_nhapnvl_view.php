<<<<<<< HEAD
<h1 class="text-center">CHI TIẾT ĐỀ XUẤT</h1>
<?php 
=======
<?php

session_start();
>>>>>>> b735788cc6c69a88e029efd46404031e4c656ed7
if (isset($_REQUEST['idDX'])) {
    $idDX = $_REQUEST['idDX'];   
}

$p->CTDX("select * from dexuat dx inner join nguyenvatlieu nvl on dx.maNVL = nvl.maNguyenVatlieu where madexuat='$idDX' ");
?>
<form action="" method="post">
<div class="text-center">
    <button style="margin-right:50px;" type="button" class="btn btn-success" onclick="window.history.back()">Trở lại</button>
    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">Điều phối</button>
</div>
    <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">
            <!-- Modal content-->
                <div class="modal-content" style="width:800px; margin-right:200px;"> 
                    <div class="modal-header">
                    <h4 class="modal-title">ĐIỀU PHỐI NHẬP</h4>
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
                // Đếm số lượng biểu mẫu hiện có và tạo mã mới cho biểu mẫu
                $rowCounted = $p->countRow("SELECT * FROM bieumaunhap");
                $maBMNhap = "BMN" . str_pad($rowCounted + 1, 2, "0", STR_PAD_LEFT);
    
                // Lấy dữ liệu từ biểu mẫu gửi đi
                $tenNguoiGiao = $_POST['tennguoigiao'];
                $ngayNhap = $_POST['date'];
                $idDX = $_REQUEST['idDX'];
    
                // Thêm biểu mẫu mới vào bảng bieumaunhap
                $p->InsertUpdate("INSERT INTO bieumaunhap (maBMNhap, maDeXuat, ngayNhap, loaiNhap, tenNguoiGiao, trangThai) VALUES ('$maBMNhap', '$idDX', '$ngayNhap', 'Nguyên vật liệu', '$tenNguoiGiao', 'Chưa lập phiếu')");
                $maNVL = $_SESSION['maNVL'];
    
                // Kết hợp $maKho và $manvl thành một mảng đa chiều
                $combinedArray = array_combine($_POST['maKho'], $maNVL);
                // Vòng lặp để chèn dữ liệu vào bảng chitietbieumaunhap
                foreach ($combinedArray as $maKho => $manvl) {
                    $tenNguyenVatLieu = $p->pickColumn("SELECT tenNguyenVatLieu FROM nguyenvatlieu WHERE maNguyenVatLieu = '{$manvl['maNguyenVatLieu']}'");
                    $donViTinh = $p->pickColumn("SELECT donViTinh FROM nguyenvatlieu WHERE maNguyenVatLieu = '{$manvl['maNguyenVatLieu']}'");
                    $soLuong = $p->pickColumn("SELECT soLuong FROM dexuat WHERE maNVL = '{$manvl['maNguyenVatLieu']}'");
                    $p->InsertUpdate("INSERT INTO chitietbieumaunhap (maBMNhap, maKho, tenSanPham, donViTinh, soLuong) VALUES ('$maBMNhap', '$maKho', '$tenNguyenVatLieu', '$donViTinh', '$soLuong')");
                }
                break;
            }   
    }
}
?>



  