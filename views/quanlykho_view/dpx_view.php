<select id="selectOption" class="form-select form-control">
    <option selected >Chọn loại đề xuất</option>
    <option value="dexuat">Xuất nguyên vật liệu</option>
    <option value="donhang">Xuất thành phẩm</option>
</select>
<div id="tableDexuat">
    <!-- Bảng xuất nguyên vật liệu -->
    <?php
    $link = $p->connect();
    $result = mysql_query("select* from dexuat where tenDeXuat ='Đề xuất xuất nguyên vật liệu cho sản xuất' and trangThai ='Đã duyệt' group by maDeXuat", $link);
    $count = 1; // Đưa biến count ra khỏi vòng lặp để đếm số thứ tự
    echo'<table class="table table-bordered table-hover">
    <thead>

   
        <tr>
            <th>Stt</th>
            <th>Mã đề xuất</th>
            <th>Tên đề xuất</th>
            <th>Trạng thái</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>';
    if (mysql_num_rows($result) > 0) {
        while ($row = mysql_fetch_array($result)) {
            $maDeXuat = $row['maDeXuat'];
            $tenDeXuat = $row['tenDeXuat'];
            $trangThai = $row['trangThai'];
            echo '<tr>
                    <td>'.$count++.'</td> 
                    <td>'.$maDeXuat.'</td> 
                    <td>'.$tenDeXuat.'</td> 
                    <td>'.$trangThai.'</td>
                    <td><a href="dp_xuatnvl.php?idDX='.$maDeXuat.'" class="btn btn-info">Xem chi tiết</a></td>
                </tr>';
        }
    } 
    
    echo'</tbody>
</table>';
    ?>
</div>

<div id="tableDonhang" style="display: none;">
    <!-- Bảng đơn hàng -->
    <?php
    $link = $p->connect();
    $result = mysql_query("select* from donhang", $link);
    $count = 1; // Đưa biến count ra khỏi vòng lặp để đếm số thứ tự
    echo'<table class="table table-bordered table-hover">
    <thead>

   
        <tr>
            <th>Stt</th>
            <th>Mã biểu mẫu</th>
            <th>Tên khách hàng</th>
            <th>Ngày đặt hàng</th>
            <th>Ngày giao dự kiến</th>
            <th>Trạng thái</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>';
    if (mysql_num_rows($result) > 0) {
        while ($row = mysql_fetch_array($result)) {
            $maDonHang = $row['maDonHang'];
            $tenKhachHang = $row['tenKhachHang'];
            $ngayDatHang = $row['ngayDatHang'];
            $ngayGiaoDuKien = $row['ngayGiaoDuKien'];
            $trangThai = $row['trangThai'];
            echo '<tr>
                    <td>'.$count++.'</td> <!-- Số thứ tự -->
                    <td>'.$maDonHang.'</td> 
                    <td>'.$tenKhachHang.'</td> <!-- Đơn vị tính -->
                    <td>'.$ngayDatHang.'</td> 
                    <td>'.$ngayGiaoDuKien.'</td> 
                    <td>'.$trangThai.'</td> 
                    <td><a href="order.php?idDX='.$maDeXuat.'" class="btn btn-info">Xem chi tiết</a></td>
                </tr>';
        }
    } 
    
    echo'</tbody>
</table>';

    ?>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        document.getElementById("selectOption").addEventListener("change", function() {
            var value = this.value;
            if (value === "dexuat") {
                document.getElementById("tableDexuat").style.display = "block";
                document.getElementById("tableDonhang").style.display = "none";
            } else if (value === "donhang") {
                document.getElementById("tableDexuat").style.display = "none";
                document.getElementById("tableDonhang").style.display = "block";
            } else {
                document.getElementById("tableDexuat").style.display = "none";
                document.getElementById("tableDonhang").style.display = "none";
            }
        });
    });
</script>

<style>
    #tableDexuat,
    #tableDonhang {
        display: none;
    }
</style>


