<?php 
if (isset($_REQUEST['idDX'])) {
    $idDX = $_REQUEST['idDX'];   
}
?>

<h1 >Thông tin đề xuất</h1>
<h2>Mã đề xuất: <?php echo $idDX ?></h2>

<div class="warehouse">
    <div class="warehouse-information">
        <p><b>Tên đề xuất:</b> <?php echo $p->pickColumn("select tenDeXuat from dexuat
        where maDeXuat = '$idDX' limit 1"); ?></p>
        <p><b>Ngày nhập:</b> <?php echo $p->pickColumn("select ngayNhap from bieumaunhap
        where maBMNhap = '$idBMN' limit 1"); ?></p>
        <p><b>Kho nhập:</b> <?php echo $p->pickColumn("SELECT kho.tenKho
            FROM bieumaunhap
            INNER JOIN kho ON bieumaunhap.maKho = kho.maKho
            WHERE bieumaunhap.maBMNhap = '$idBMN'"); ?>
        </p>
        <h2 style="text-align: center; font-size: 1.8em;"><b>Danh sách hàng hóa:</b></h2>
    </div>

    <div class="listproduct">
        <table class="table table-bordered">
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