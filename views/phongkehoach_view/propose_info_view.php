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
    
        <h2 style="text-align: center; font-size: 1.8em;"><b>Danh sách hàng hóa:</b></h2>
    </div>

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
        </div>
</div>