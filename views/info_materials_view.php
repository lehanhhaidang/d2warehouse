<div class="warehouse">
        <div class="listproduct">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>STT</th>
                        <th>Mã lô</th>
                        <th>Tên Nguyên Vật Liệu</th>
                        <th>Đơn vị tính</th>
                        <th>Số Lượng Tồn</th>
                        <th>Ngày sản xuất</th>
                        <th>Ngày hết hạn</th>
                    </tr>
                </thead>
                <tbody>
					  <?php
					   if (isset($_REQUEST['maNguyenVatLieu']))
							{
								$manvl = $_REQUEST['maNguyenVatLieu'];
							}
								 $p->xuatChiTietNVL("SELECT * FROM nguyenvatlieu
									INNER JOIN longuyenvatlieu ON nguyenvatlieu.maNguyenVatLieu = longuyenvatlieu.maNguyenVatLieu
									WHERE nguyenvatlieu.maNguyenVatLieu = '$manvl'");
						?>
                </tbody>
            </table>
        </div>