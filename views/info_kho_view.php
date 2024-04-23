<?php
	   if (isset($_REQUEST['maKho']))
			{
				$makho = $_REQUEST['maKho'];
			}
				$p -> xuatchitietkho("select * from kho where maKho = '$makho'");
			
			?>
        <div class="listproduct">
            <table class="table table-border table-success">
                <thead>
                    <tr>
                        <th>Tên nguyên vật liệu</th>
                        <th>Đơn vị tính</th>
                        <th>Số lượng</th>
                        <th>Ngày sản xuất</th>
                        <th>Hạn sử dụng</th>
                    </tr>
                </thead>
                <tbody>
					<?php
					   if (isset($_REQUEST['makho']))
							{
								$makho = $_REQUEST['makho'];
							}
							 $p->xuatLoKhoNVL("SELECT *
									   FROM kho
									   INNER JOIN longuyenvatlieu ON kho.maKho = longuyenvatlieu.maKho
									   INNER JOIN nguyenvatlieu ON longuyenvatlieu.maNguyenVatLieu = nguyenvatlieu.maNguyenVatLieu
									   WHERE kho.maKho = '$makho'  /*AND longuyenvatlieu.maPXNVL IS NULL*/");


					?>
                </tbody>
            </table>
        </div>