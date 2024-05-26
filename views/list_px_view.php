<select id="selectOption" class="form-select form-control-sm col-12 " >
    <option selected >Chọn loại phiếu</option>
    <option value="dexuat">Phiếu xuất nguyên vật liệu</option>
    <option value="donhang">Phiếu xuất thành phẩm</option>
</select>
<div id="tableDexuat">
    <!-- Bảng xuất nguyên vật liệu -->
    <?php
    $link = $p->connect();
    $result = mysqli_query($link, "select* from phieuxnvl");
    $count = 1; // Đưa biến count ra khỏi vòng lặp để đếm số thứ tự
    echo'<table class="tbldexuat table table-border table-hover">
    <thead>

   
        <tr>
            <th>Stt</th>
            <th>Mã phiếu</th>
            <th>Tên phiếu</th>
            <th>Tên người nhận</th>
            <th>Ngày xuất kho</th>
            <th>Ngày lập phiếu</th>

        </tr>
    </thead>
    <tbody>';
    if (mysqli_num_rows($result) > 0) {
        while ($row = mysqli_fetch_array($result)) {
            $maDeXuat = $row['maPXNVL'];
            $tenDeXuat = "Phiếu xuất kho nguyên vật liệu";
            $tenNguoiNhan = $row['tenNguoiNhan'];
            $ngayXuatKho = $row['ngayXuat'];
            $ngayLapPhieu = $row['ngayLap'];
            echo '<tr>
                    <td>'.$count++.'</td> <!-- Số thứ tự -->
                    <td>'.$maDeXuat.'</td>
                    <td>'.$tenDeXuat.'</td> <!-- Đơn vị tính -->
                    <td>'.$tenNguoiNhan.'</td>
                    <td>'.$ngayXuatKho.'</td>
                    <td>'.$ngayLapPhieu.'</td>
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
    $result = mysqli_query($link, "select* from phieuxtp");
    $count = 1; // Đưa biến count ra khỏi vòng lặp để đếm số thứ tự
    echo'<table class="tbldexuat table table-border table-hover">
    <thead>

   
        <tr>
            <th>Stt</th>
            <th>Mã phiếu</th>
            <th>Tên phiếu</th>
            <th>Tên người nhận</th>
            <th>Ngày xuất kho</th>
            <th>Ngày lập phiếu</th>
        </tr>
    </thead>
    <tbody>';
    if (mysqli_num_rows($result) > 0) {
        while ($row = mysqli_fetch_array($result)) {
            $maDeXuat = $row['maPXTP'];
            $tenDeXuat = "Phiếu xuất kho thành phẩm";
            $tenNguoiNhan = $row['tenNguoiNhan'];
            $ngayXuatKho = $row['ngayXuat'];
            $ngayLapPhieu = $row['ngayLap'];
            echo '<tr>
                    <td>'.$count++.'</td> <!-- Số thứ tự -->
                    <td>'.$maDeXuat.'</td>
                    <td>'.$tenDeXuat.'</td> <!-- Đơn vị tính -->
                    <td>'.$tenNguoiNhan.'</td>
                    <td>'.$ngayXuatKho.'</td>
                    <td>'.$ngayLapPhieu.'</td>
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
