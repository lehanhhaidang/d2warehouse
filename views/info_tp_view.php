<div class="warehouse">
        <h1 class="text-center">CHI TIẾT THÀNH PHẨM</h1>
        <div class="listproduct">
        
            <table class="table table-border table-hover">
                <thead>
                    <tr>
                        <th>Ảnh</th>
                        <th>Mã Lô Thành Phẩm</th>
                        <th>Mã Thành Phẩm</th>
                        <th>Tên Thành Phẩm</th>
                        <th>Đơn vị tính</th>
                        <th>Số Lượng Tồn</th>
                        <th>Ngày sản xuất</th>
                        <th>Ngày hết hạn</th>
                    </tr>
                </thead>
                <tbody>
					  <?php
					   if (isset($_REQUEST['maThanhPham']))
							{
								$maThanhPham = $_REQUEST['maThanhPham'];
							}
								 $p->xuatChiTietTP("SELECT * FROM thanhpham
									INNER JOIN lothanhpham ON thanhpham.maThanhPham = lothanhpham.maThanhPham
									WHERE lothanhpham.maThanhPham = '$maThanhPham'");
						?>
                </tbody>
            </table>
        </div>
        