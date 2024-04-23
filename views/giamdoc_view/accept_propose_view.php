<?php 
if (isset($_REQUEST['idDX'])) {
    $idDX = $_REQUEST['idDX'];   
}
?>

<form action="" method="post">
<h1 >Thông tin đề xuất</h1>
<h2>Mã đề xuất: <?php echo $idDX ?></h2>
<h5>Ghi chú: </h5> <p>Dựa vào thông tin trong kho, phòng kế hoạch đề xuất kế hoạch nhập kho vào ngày $đoạn này select ngày
    với danh sách nguyên vật liệu cần thiết như sau:
</p>

    <div class="listpropose">
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>STT</th>
                    <th>Mã nguyên vật liệu</th>
                    <th>Tên nguyên vật liệu</th>
                    <th>Số lượng trong kho</th>
                    <th>Số lượng nhập thêm</th>
                </tr>
            </thead>
            <tbody>
                <?php
                $p->accept_propose("select * from dexuat dx inner join nguyenvatlieu nvl on dx.maNVL = nvl.maNguyenVatlieu where madexuat='$idDX' "); 
                ?>
            </tbody>
        </table>
    </div>
    <div class="button" style="align-items: center;">
        <button type="button" class="btn btn-success" onclick="window.history.back()">Trở lại</button>
        <button class="btn btn-warning" type="submit" name="button" value="tuchoi" formaction="">Từ chối</button>
        <button class="btn btn-primary" type="submit" name="button" value="duyet" formaction="">Duyệt phiếu</button>
    </div>
</form>
<?php

    switch($_POST['button'])
    {
        case "duyet":
            {
                $link= $p->connect();
                $sql = "UPDATE dexuat set trangThai ='Đã duyệt' where maDeXuat ='$idDX'";
                mysql_query($sql,$link);

            
                break;
            }
        case "tuchoi":
            {
                $link= $p->connect();
                $sql = "UPDATE dexuat set trangThai ='Đã từ chối' where maDeXuat ='$idDX'";
                mysql_query($sql,$link);
                break;
            }
    }
?>