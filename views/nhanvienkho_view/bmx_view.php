<?php 
if (isset($_REQUEST['idBMX'])) {
    $idBMX = $_REQUEST['idBMX'];   
}
?>

<h3 class="text-center text-success">BIỂU MẪU XUẤT KHO</h3>
<p class="text-center"><b>Mã biểu mẫu: <?php echo $idBMX ?></b></p>

<div class="warehouse">
    <div class="warehouse-information">
        <p class="text-center"><b>Tên người nhận:</b> <?php echo $p->pickColumn("select tenNguoiNhan from bieumauxuat
        where maBMXuat = '$idBMX' limit 1"); ?></p>
        <p class="text-center"><b>Ngày xuất:</b> <?php echo $p->pickColumn("select ngayXuat from bieumauxuat
        where maBMXuat = '$idBMX' limit 1"); ?></p>
        <p class="text-center"><b>Kho xuất:</b> <?php echo $p->pickColumn("SELECT kho.tenKho
            FROM bieumauxuat
            INNER JOIN kho ON bieumauxuat.maKho = kho.maKho
            WHERE bieumauxuat.maBMXuat = '$idBMX'"); ?>
        </p>
        <h2 style="text-align: center; font-size: 1.8em;"><b>Danh sách hàng hóa:</b></h2>
    </div>

    <div class="listproduct">
        <table class="table table-border table-success table-hover">
            <thead>
                <tr>
                    <th>STT</th>
                    <th>Tên sản phẩm</th>
                    <th>Đơn vị tính</th>
                    <th>Số lượng</th>
                    <th>Ngày sản xuất</th>
                    <th>Ngày hết hạn</th>
                </tr>
            </thead>
            <tbody>
            <?php
                    $maKho = $p->pickColumn("select maKho from bieumauxuat where maBMXuat = '$idBMX'");
                    if(strpos($maKho,"KNVL") !== false)
                    {
                                 $p->DSLNVL("SELECT
                                    nv.tenNguyenVatLieu,
                                    lgl.soLuong,
                                    nv.donViTinh,
                                    lgl.NSX,
                                    lgl.NHH
                                FROM
                                    bieumauxuat bmx
                                    JOIN longuyenvatlieu lgl ON bmx.maBMXuat = lgl.maBMXuat
                                    JOIN nguyenvatlieu nv ON lgl.maNguyenVatLieu = nv.maNguyenVatLieu
                                WHERE
                                    bmx.maBMXuat = '$idBMX'"); 
                    }
                    else
                    {
                                $p->DSTP("SELECT
                                nv.tenThanhPham,
                                lgl.soLuong,
                                nv.donViTinh,
                                lgl.NSX,
                                lgl.NHH
                            FROM
                                bieumauxuat bmx
                                JOIN lothanhpham lgl ON bmx.maBMXuat = lgl.maBMXuat
                                JOIN thanhpham nv ON lgl.maThanhPham = nv.maThanhPham
                            WHERE
                                bmx.maBMXuat = '$idBMX'"); 
                    

                    }
                    
                    
                    
               
                    ?>
            </tbody>
        </table>
    </div>
</div>

<?php
$tenKho = $p->pickColumn("SELECT kho.tenKho
                    FROM bieumauxuat
                    INNER JOIN kho ON bieumauxuat.maKho = kho.maKho
                    WHERE bieumauxuat.maBMXuat = '$idBMX'");
$trangThai = $p->pickColumn("SELECT trangThai FROM bieumauxuat WHERE maBMXuat = '$idBMX'");

// Kiểm tra điều kiện và xác định link chuyển hướng
if (strpos($tenKho, 'Kho Nguyên Vật Liệu') !== false) {
    $redirectLink = 'create_pxnvl.php?idBMX=' . $idBMX;
} elseif (strpos($tenKho, 'Kho Thành Phẩm') !== false) {
    $redirectLink = 'create_pxtp.php?idBMX=' . $idBMX;
}


?>

<!-- Tạo biểu mẫu và hai nút căn giữa sử dụng Bootstrap -->
<form method="post">
    <div style="text-align: center; margin-top: 20px;">
        <!-- Nút trở lại luôn chuyển hướng về trang trước -->
        <button style="margin-right:50px;" type="button" class="btn btn-success" onclick="window.history.back()">Trở lại</button>
        <?php if (isset($redirectLink)): ?>
            <!-- Nút submit sẽ chuyển hướng tùy thuộc vào điều kiện -->
            <button class="btn btn-primary" type="submit" formaction="<?php echo $redirectLink; ?>">Lập phiếu</button>
        <?php endif; ?>
    </div>
</form>
