<form action="create_dxnnvl.php" method="post">
    <h1 align="center">DANH SÁCH NGUYÊN VẬT LIỆU</h1>
    <div class="donhang">
        <table class="table table-border table-hover table-success">
            <thead>
                <tr>
                    <th>Stt</th>
                    <th>Mã nguyên vật liệu</th>
                    <th>Tên nguyên vật liệu</th>
                    <th>Đơn vị tính</th>
                    <th>Số lượng tồn</th>
                    <th>Chọn</th> <!-- Thêm cột chọn checkbox -->
                </tr>
            </thead>
            <tbody>
            <?php
            $p->list_material("select * from nguyenvatlieu"); 
            ?>
            </tbody>
        </table>
    </div>
    <div class="text-center">
    <button type="submit" class="btn btn-warning text-dark">Thêm đề xuất nhập</button>
    </div>
</form>
