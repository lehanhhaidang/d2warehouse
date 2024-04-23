<form action="create_dxxnvl.php" method="post">
    <h1 align="center">DANH SÁCH THÀNH PHẨM</h1>
    <div class="donhang">
        <table class="table table-bordered table-hover table-success">
            <thead>
                <tr>
                    <th>Stt</th>
                    <th>Mã thành phẩm</th>
                    <th>Tên thành phẩm</th>
                    <th>Đơn vị tính</th>
                    <th>Số lượng tồn</th>
                    <th>Chọn</th> <!-- Thêm cột chọn checkbox -->
                </tr>
            </thead>
            <tbody>
            <?php
            $p->list_product("select * from thanhpham"); 
            ?>
            </tbody>
        </table>
    </div>
    <button type="submit" class="btn btn-success btn-outline-primary">Thêm Đề Xuất Sản Xuất</button>
</form>
