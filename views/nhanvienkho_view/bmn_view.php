<?php 
if (isset($_REQUEST['idBMN'])) {
    $idBMN = $_REQUEST['idBMN'];   
}
?>

<h1 class="text-center text-success">BIỂU MẪU NHẬP KHO</h1>
<h2 class="text-center">Mã biểu mẫu: <?php echo $idBMN ?></h2>

<div class="warehouse">
    <div class="warehouse-information">
        <p class="text-center"><b>Tên người giao:</b> <?php echo $p->pickColumn("select tenNguoiGiao from bieumaunhap
        where maBMNhap = '$idBMN' limit 1"); ?></p>
        <p class="text-center"><b>Ngày nhập:</b> <?php echo $p->pickColumn("select ngayNhap from bieumaunhap
        where maBMNhap = '$idBMN' limit 1"); ?></p>
        <p class="text-center"><b>Kho nhập:</b> <?php echo $p->pickColumn("SELECT kho.tenKho
            FROM bieumaunhap
            INNER JOIN kho ON bieumaunhap.maKho = kho.maKho
            WHERE bieumaunhap.maBMNhap = '$idBMN'"); ?>
        </p>
        <h2 style="text-align: center; font-size: 1.8em;"><b>Danh sách hàng hóa:</b></h2>
    </div>

    <div class="listproduct">
        <table class="table table-border table-hover">
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
                $p->DSSP("select * from chitietbieumaunhap where maBMNhap ='$idBMN'"); 
                ?>
            </tbody>
        </table>
    </div>
</div>

<?php
$tenKho = $p->pickColumn("SELECT kho.tenKho
                    FROM bieumaunhap
                    INNER JOIN kho ON bieumaunhap.maKho = kho.maKho
                    WHERE bieumaunhap.maBMNhap = '$idBMN'");
$trangThai = $p->pickColumn("SELECT trangThai FROM bieumaunhap WHERE maBMNhap = '$idBMN'");

// Kiểm tra điều kiện và xác định link chuyển hướng
if (strpos($tenKho, 'Kho Nguyên Vật Liệu') !== false) {
    $redirectLink = 'create_pnnvl.php?idBMN=' . $idBMN;
} elseif (strpos($tenKho, 'Kho Thành Phẩm') !== false) {
    $redirectLink = 'create_pntp.php?idBMN=' . $idBMN;
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
