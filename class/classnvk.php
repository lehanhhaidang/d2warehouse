<?php
class nhanvienkho
{
	public function connect()
	{
		$con = mysql_connect("localhost","root","");
		if(!$con)
		{
			echo 'Không kết nối được csdl';
			exit();
		}
		else
		{
			mysql_select_db("d2warehouse");
			mysql_query("SET NAMES UTF8");
			return $con;
		}
	}
	public function pickColumn ($sql)
	{
		$link = $this -> connect();
		$result = mysql_query($sql,$link);
		$i = mysql_num_rows($result);
		$value = '';
		if($i>0)
		{
			while($row = mysql_fetch_array($result))
			{
				$value = $row[0];
			}
		}
		return $value;
	}
	public function countRow ($sql)
    {
        $link = $this -> connect();
		$result = mysql_query($sql,$link);
		$i = mysql_num_rows($result);
        return $i;
    }
	public function InsertUpdate($sql)
	{
		$link = $this->connect();
		if(mysql_query($sql,$link))
		{
			return 1;
		}
		else
		{
			return 0;
		}
	}
	public function tongbm($sql)
	{
		$link = $this->connect();
		$ketqua = mysql_query($sql, $link);
		$i = mysql_num_rows($ketqua);

		// Khởi tạo biến tổng số biểu mẫu
		$total = 0;

		if ($i > 0) {
			// Nếu có kết quả trả về, lặp qua từng dòng dữ liệu để tính tổng
			while ($row = mysql_fetch_assoc($ketqua)) {
				// Lấy giá trị từ cột "total" (hoặc tên cột chứa tổng số biểu mẫu)
				$total += $row['total'];
			}
		}

		// Kết thúc việc sử dụng kết nối MySQL
		mysql_close($link);

		// Trả về tổng số biểu mẫu
		return $total;
	}
	
	
	public function xuatdskhoNVL($sql)
	{
		$link = $this -> connect();
		$ketqua = mysql_query($sql, $link);
		$i = mysql_num_rows($ketqua);
		if ($i >0)
		{
			while ($row=mysql_fetch_array($ketqua))
			{
				$makho = $row['maKho'];
				$tenkho = $row['tenKho'];
			
			echo '
            <a href="info_kho.php?maKho='.$makho.'">
                <div class="kho-sub">'.$tenkho.'</div>
            </a>
        ';
			}
		}
		else
		{
			echo 'Không có dữ liệu';
		}
		mysql_close($link);
	}
	
	public function xuatdskhotp($sql)
	{
		$link = $this -> connect();
		$ketqua = mysql_query($sql, $link);
		$i = mysql_num_rows($ketqua);
		if ($i >0)
		{
			while ($row=mysql_fetch_array($ketqua))
			{
				$makho = $row['maKho'];
				$tenkho = $row['tenKho'];
			
			echo '
            <a href="ChiTietKhoTP.php?maKho='.$makho.'">
                <div class="kho-sub">'.$tenkho.'</div>
            </a>
        ';
			}
		}
		else
		{
			echo 'Không có dữ liệu';
		}
		mysql_close($link);
	}
	
	public function xuatchitietkho($sql)
	{
		$link = $this->connect();
		$ketqua = mysql_query($sql, $link);

		if ($ketqua) {
			$row = mysql_fetch_array($ketqua);

			// Lấy thông tin từ dữ liệu
			$makho = $row['maKho'];
			$tenkho = $row['tenKho'];
			$maPhieu = $row['maPhieu'];
			$diaChiKho = $row['diaChiKho'];
			$dungLuongKhoToiDa = $row['dungLuongKhoToiDa'];
			$tinhTrangKho = $row['tinhTrangKho'];

			// In ra thông tin trong mẫu HTML
			echo '<h1 style="text-transform:uppercase;"class="text-center text-info">' . $tenkho . '</h1>';
			echo '<h2 class="text-center text-dark">Mã kho: ' . $makho . '</h2>';
			echo '<div class="warehouse" class="text-center text-dark">';
			echo '    <div class="warehouse-information" class="text-center text-dark">';
			echo '        <p class="text-center text-dark"><b>Địa chỉ:</b> ' . $diaChiKho . '</p>';
			echo '        <p class="text-center text-dark"><b>Dung lượng kho tối đa:</b> ' . $dungLuongKhoToiDa . '</p>';
			echo '        <p class="text-center text-dark"><b>Tình trạng:</b> ' . $tinhTrangKho . '</p>';
			echo '        <h2 style="text-align: center; font-size: 1.8em;" class="text-dark"><b>Danh sách hàng hóa</b></h2>';
			echo '    </div>';
			} else {
				echo 'Không có dữ liệu';
			}

		mysql_close($link);
	}
	
	public function xuatLoKhoNVL($sql)
	{
		$link = $this->connect();
		$ketqua = mysql_query($sql, $link);

		if ($ketqua) 
		{
			while ($row=mysql_fetch_array($ketqua))
			{
			// Lấy thông tin từ dữ liệu
			$anh=$row['anh'];
			$tenNguyenVatLieu = $row['tenNguyenVatLieu'];
			$donViTinh = $row['donViTinh'];
			$soLuong = $row['soLuong'];
			$NSX = $row['NSX'];
			$NHH = $row['NHH'];
			// In ra thông tin trong mẫu HTML
			echo '<tr> 
						<td><img src="./uploads/'.$anh.'" width="100px" height="100px"></td>
                        <td>'.$tenNguyenVatLieu.'</td>
                        <td>'.$donViTinh.'</td>
                        <td>'.$soLuong.'</td>
                        <td>'.$NSX.'</td>
                        <td>'.$NHH.'</td>
                    </tr>';
			}
		} 
			else {
				echo 'Không có dữ liệu';
			}

		mysql_close($link);
	}
		
	public function xuatLoKhoTP($sql)
	{
		$link = $this->connect();
		$ketqua = mysql_query($sql, $link);

		if ($ketqua) 
		{
			while ($row=mysql_fetch_array($ketqua))
			{
			// Lấy thông tin từ dữ liệu
			$makho = $row['maKho'];
			$tenkho = $row['tenKho'];
			$maKe = $row['maKe'];
			$tenKe = $row['tenKe'];
			$tenThanhPham = $row['tenThanhPham'];
			$donViTinh = $row['donViTinh'];
			$soLuong = $row['soLuong'];
			$NSX = $row['NSX'];
			$NHH = $row['NHH'];
			// In ra thông tin trong mẫu HTML
			echo '<tr>
                        <td>'.$tenKe.'</td>
                        <td>'.$tenThanhPham.'</td>
                        <td>'.$donViTinh.'</td>
                        <td>'.$soLuong.'</td>
                        <td>'.$NSX.'</td>
                        <td>'.$NHH.'</td>
                    </tr>';
			}
		} 
			else {
				echo 'Không có dữ liệu';
			}

		mysql_close($link);
	}
	
	
	
	
	public function xuatTenNVL($sql)
	{
		$link = $this -> connect();
		$ketqua = mysql_query($sql, $link);
		$i = mysql_num_rows($ketqua);
		if ($i >0)
		{
			while ($row=mysql_fetch_array($ketqua))
			{
				$manvl = $row['maNguyenVatLieu'];
				$tennvl = $row['tenNguyenVatLieu'];
			echo '
					 <h1 style="text-transform: uppercase;">'.$tennvl.'</h1>
				';
			}
		}
		else
		{
			echo 'Không có dữ liệu';
		}
		mysql_close($link);
	}
	
	public function xuatChiTietNVL($sql)
	{
		$link = $this -> connect();
		$ketqua = mysql_query($sql, $link);
		$i = mysql_num_rows($ketqua);
		if ($i >0)
		{
			$dem =1;
			while ($row=mysql_fetch_array($ketqua))
			{
				$anh=$row['anh'];
				$manvl = $row['maNguyenVatLieu'];
				$maLoNVL = $row['maLoNVL'];
				$maNVL=$row['maNguyenVatLieu'];
				$tenNguyenVatLieu = $row['tenNguyenVatLieu'];
				$donViTinh = $row['donViTinh'];
				$soLuongTonnvl = $row['soLuongTonnvl'];
				$NSX = $row['NSX'];
				$NHH = $row['NHH'];
			echo '
           			<tr>
					   <td><img src="./uploads/'.$anh.'" width="100px" height="100px"></td>
                        <td>'.$maLoNVL.'</td>
						<td>'.$maNVL.'</td>
						<td>'.$tenNguyenVatLieu.'</td>
                        <td>'.$donViTinh.'</td>
                        <td>'.$soLuongTonnvl.'</td>
                        <td>'.$NSX.'</td>
                        <td>'.$NHH.'</td>
                    </tr>';
				$dem ++;
			}
		}
		else
		{
			echo 'Không có dữ liệu';
		}
		mysql_close($link);
	}
	
	public function xuatTenTP($sql)
	{
		$link = $this -> connect();
		$ketqua = mysql_query($sql, $link);
		$i = mysql_num_rows($ketqua);
		if ($i >0)
		{
			while ($row=mysql_fetch_array($ketqua))
			{
				$matp = $row['maThanhPham'];
				$tenThanhPham = $row['tenThanhPham'];
			echo '
					 <h1 style="text-transform: uppercase;">'.$tenThanhPham.'</h1>
				';
			}
		}
		else
		{
			echo 'Không có dữ liệu';
		}
		mysql_close($link);
	}
	
	public function xuatChiTietTP($sql)
	{
		$link = $this -> connect();
		$ketqua = mysql_query($sql, $link);
		$i = mysql_num_rows($ketqua);
		if ($i >0)
		{
			$dem =1;
			while ($row=mysql_fetch_array($ketqua))
			{
				$anh=$row['anh'];
				$maLoTP=$row['maLoTP'];
				$maTP=$row['maThanhPham'];
				$tenThanhPham = $row['tenThanhPham'];
				$donViTinh = $row['donViTinh'];
				$soLuongTon = $row['soLuongTon'];
				$NSX = $row['NSX'];
				$NHH = $row['NHH'];
			echo '
           			<tr>
					    <td><img src="./uploads/'.$anh.'" width="100px" height="100px"></td>
						<td>'.$maLoTP.'</td>
						<td>'.$maTP.'</td>
						<td>'.$tenThanhPham.'</td>
                        <td>'.$donViTinh.'</td>
                        <td>'.$soLuongTon.'</td>
                        <td>'.$NSX.'</td>
                        <td>'.$NHH.'</td>
                    </tr>';
				$dem ++;
			}
		}
		else
		{
			echo 'Không có dữ liệu';
		}
		mysql_close($link);
	}
	
	public function xuatdspnnvl($sql)
	{
		$link = $this -> connect();
		$ketqua = mysql_query($sql, $link);
		$i = mysql_num_rows($ketqua);
		if ($i >0)
		{
			while ($row=mysql_fetch_array($ketqua))
			{
				$maPNNVL = $row['maPNNVL'];
			
			echo '
            <a href="ChiTietPhieuNhapNVL.php?maPNNVL='.$maPNNVL.'">
                <div class="kho-sub">'.$maPNNVL.'</div>
            </a>
        ';
			}
		}
		else
		{
			echo 'Không có dữ liệu';
		}
		mysql_close($link);
	}
	
	public function xuatdspntp($sql)
	{
		$link = $this -> connect();
		$ketqua = mysql_query($sql, $link);
		$i = mysql_num_rows($ketqua);
		if ($i >0)
		{
			while ($row=mysql_fetch_array($ketqua))
			{
				$maPNTP = $row['maPNTP'];
			
			echo '
            <a href="ChiTietPhieuNhapTP.php?maPNTP='.$maPNTP.'">
                <div class="kho-sub">'.$maPNTP.'</div>
            </a>
        ';
			}
		}
		else
		{
			echo 'Không có dữ liệu';
		}
		mysql_close($link);
	}
	
	public function xuatdspxnvl($sql)
	{
		$link = $this -> connect();
		$ketqua = mysql_query($sql, $link);
		$i = mysql_num_rows($ketqua);
		if ($i >0)
		{
			while ($row=mysql_fetch_array($ketqua))
			{
				$maPXNVL = $row['maPXNVL'];
			
			echo '
            <a href="ChiTietPhieuXuatNVL.php?maPXNVL='.$maPXNVL.'">
                <div class="kho-sub">'.$maPXNVL.'</div>
            </a>
        ';
			}
		}
		else
		{
			echo 'Không có dữ liệu';
		}
		mysql_close($link);
	}
	
	public function xuatdspxtp($sql)
	{
		$link = $this -> connect();
		$ketqua = mysql_query($sql, $link);
		$i = mysql_num_rows($ketqua);
		if ($i >0)
		{
			while ($row=mysql_fetch_array($ketqua))
			{
				$maPXTP = $row['maPXTP'];
			
			echo '
            <a href="ChiTietPhieuXuatTP.php?maPXTP='.$maPXTP.'">
                <div class="kho-sub">'.$maPXTP.'</div>
            </a>
        ';
			}
		}
		else
		{
			echo 'Không có dữ liệu';
		}
		mysql_close($link);
	}
	
	
	public function xuatCTPhieuNNVL($sql)
	{
		$link = $this -> connect();
		$ketqua = mysql_query($sql, $link);
		$i = mysql_num_rows($ketqua);
		if ($i >0)
		{
			while ($row=mysql_fetch_array($ketqua))
			{
				// Lấy thông tin từ dữ liệu
			$maPNNVL = $row['maPNNVL'];
			$maNVKho = $row['maNVKho'];
			$tenNVKho = $row['tenNVKho'];
			$tenkho = $row['tenKho'];
			$tenNguoiGiao = $row['tenNguoiGiao'];
			$ngayNhap = $row['ngayNhap'];
			$ngayLap = $row['ngayLap'];
				
			echo '
				  <h2>Mã phiếu: '.$maPNNVL.'</h2>
			<div class="warehouse">
				<div class="warehouse-information">
					<p><b>Tên người giao:</b> '.$tenNguoiGiao.'</p>
					<p><b>Ngày nhập: </b> '.$ngayNhap.'</p>
					<p><b>Kho nhập: </b>' .$tenkho.'</p>
					<p><b>Người lập Phiếu: </b>'.$tenNVKho.'</p>
					<p><b>Ngày lập Phiếu: </b> '.$ngayLap.'</p>';
			}
		}
		else
		{
			echo 'Không có dữ liệu';
		}
		mysql_close($link);
	}
	
	
	
	public function xuatLoPhieuNNVL($sql)
{
    $link = $this->connect();
    $ketqua = mysql_query($sql, $link);
    $i = mysql_num_rows($ketqua);

    if ($i > 0) {
        $dem = 1;
        while ($row = mysql_fetch_array($ketqua)) {
            $maPNNVL = $row['maPNNVL'];
            $tenNguyenVatLieu = $row['tenNguyenVatLieu'];
            $maNguyenVatLieu = $row['maNguyenVatLieu'];
            $donViTinh = $row['donViTinh'];
            $soLuong = $row['soLuong'];
            $NSX = $row['NSX'];
            $NHH = $row['NHH'];
            $ghiChu = $row['ghiChu'];

            echo '<tr>
                        <td>' . $dem . '</td> <!-- Số thứ tự -->
                        <td>' . $tenNguyenVatLieu . '</td> <!-- Tên sản phẩm -->
                        <td>' . $donViTinh . '</td> <!-- Đơn vị tính -->
                        <td>' . $soLuong . '</td> <!-- Số lượng -->
                        <td>' . $NSX . '</td> <!-- Ngày sản xuất -->
                        <td>' . $NHH . '</td> <!-- Hạn sử dụng -->
                        <td>';

            echo '</td></tr>';

            $dem++;
        }
    } else {
        echo 'Không có dữ liệu';
    }

    mysql_close($link);
}
	
	public function xuatLoPhieuNTP($sql)
{
    $link = $this->connect();
    $ketqua = mysql_query($sql, $link);
    $i = mysql_num_rows($ketqua);

    if ($i > 0) {
        $dem = 1;
        while ($row = mysql_fetch_array($ketqua)) {
            $maPNTP = $row['maPNTP'];
            $maLoTP = $row['maLoTP'];
            $tenThanhPham = $row['tenThanhPham'];
            $maThanhPham = $row['maThanhPham'];
            $donViTinh = $row['donViTinh'];
            $soLuong = $row['soLuong'];
            $NSX = $row['NSX'];
            $NHH = $row['NHH'];
            $maKe = $row['maKe'];
            $tenKe = $row['tenKe'];
            $ghiChu = $row['ghiChu'];
            $maBBBTTP = $row['maBBBTTP'];

            echo '<tr>
                        <td>' . $dem . '</td> <!-- Số thứ tự -->
                        <td>' . $tenThanhPham . '</td> <!-- Tên sản phẩm -->
                        <td>' . $donViTinh . '</td> <!-- Đơn vị tính -->
                        <td>' . $soLuong . '</td> <!-- Số lượng -->
                        <td>' . $tenKe . '</td> <!-- Kệ -->
                        <td>' . $NSX . '</td> <!-- Ngày sản xuất -->
                        <td>' . $NHH . '</td> <!-- Hạn sử dụng -->
                        <td>';

            if (!empty($maBBBTTP)) {
                echo $ghiChu . ' - ' . $maBBBTTP;
            } else {
                echo $ghiChu;
            }

            echo '</td></tr>';

            $dem++;
        }
    } else {
        echo 'Không có dữ liệu';
    }

    mysql_close($link);
}

	public function xuatCTPhieuNTP($sql)
	{
		$link = $this -> connect();
		$ketqua = mysql_query($sql, $link);
		$i = mysql_num_rows($ketqua);
		if ($i >0)
		{
			while ($row=mysql_fetch_array($ketqua))
			{
				// Lấy thông tin từ dữ liệu
			$maPNTP = $row['maPNTP'];
			$maNVKho = $row['maNVKho'];
			$tenNVKho = $row['tenNVKho'];
			$tenkho = $row['tenKho'];
			$tenNguoiGiao = $row['tenNguoiGiao'];
			$ngayNhap = $row['ngayNhap'];
			$ngayLap = $row['ngayLap'];
				
			echo '
				  <h2>Mã phiếu: '.$maPNTP.'</h2>
			<div class="warehouse">
				<div class="warehouse-information">
					<p><b>Tên người giao:</b> '.$tenNguoiGiao.'</p>
					<p><b>Ngày nhập: </b> '.$ngayNhap.'</p>
					<p><b>Kho nhập: </b>' .$tenkho.'</p>
					<p><b>Người lập Phiếu: </b>'.$tenNVKho.'</p>
					<p><b>Ngày lập Phiếu: </b> '.$ngayLap.'</p>';
			}
		}
		else
		{
			echo 'Không có dữ liệu';
		}
		mysql_close($link);
	}
	
	public function xuatCTPhieuXNVL($sql)
	{
		$link = $this -> connect();
		$ketqua = mysql_query($sql, $link);
		$i = mysql_num_rows($ketqua);
		if ($i >0)
		{
			while ($row=mysql_fetch_array($ketqua))
			{
				// Lấy thông tin từ dữ liệu
			$maPXNVL = $row['maPXNVL'];
			$maNVKho = $row['maNVKho'];
			$tenNVKho = $row['tenNVKho'];
			$tenkho = $row['tenKho'];
			$tenNguoiNhan = $row['tenNguoiNhan'];
			$ngayXuat = $row['ngayXuat'];
			$ngayLap = $row['ngayLap'];
				
			echo '
				  <h2>Mã phiếu: '.$maPXNVL.'</h2>
			<div class="warehouse">
				<div class="warehouse-information">
					<p><b>Tên người nhận:</b> '.$tenNguoiNhan.'</p>
					<p><b>Ngày xuất: </b> '.$ngayXuat.'</p>
					<p><b>Kho nhập: </b>' .$tenkho.'</p>
					<p><b>Người lập Phiếu: </b>'.$tenNVKho.'</p>
					<p><b>Ngày lập Phiếu: </b> '.$ngayLap.'</p>';
			}
		}
		else
		{
			echo 'Không có dữ liệu';
		}
		mysql_close($link);
	}
	
	public function xuatCTPhieuXTP($sql)
	{
		$link = $this -> connect();
		$ketqua = mysql_query($sql, $link);
		$i = mysql_num_rows($ketqua);
		if ($i >0)
		{
			while ($row=mysql_fetch_array($ketqua))
			{
				// Lấy thông tin từ dữ liệu
			$maPXTP = $row['maPXTP'];
			$maNVKho = $row['maNVKho'];
			$tenNVKho = $row['tenNVKho'];
			$tenkho = $row['tenKho'];
			$tenNguoiNhan = $row['tenNguoiNhan'];
			$ngayXuat = $row['ngayXuat'];
			$ngayLap = $row['ngayLap'];
				
			echo '
				  <h2>Mã phiếu: '.$maPXTP.'</h2>
			<div class="warehouse">
				<div class="warehouse-information">
					<p><b>Tên người nhận:</b> '.$tenNguoiNhan.'</p>
					<p><b>Ngày xuất: </b> '.$ngayXuat.'</p>
					<p><b>Kho nhập: </b>' .$tenkho.'</p>
					<p><b>Người lập Phiếu: </b>'.$tenNVKho.'</p>
					<p><b>Ngày lập Phiếu: </b> '.$ngayLap.'</p>';
			}
		}
		else
		{
			echo 'Không có dữ liệu';
		}
		mysql_close($link);
	}
	
	
	
	public function xuatLoPhieuXNVL($sql)
	{
		$link = $this -> connect();
		$ketqua = mysql_query($sql, $link);
		$i = mysql_num_rows($ketqua);
		if ($i >0)
		{
			$dem =1;
			while ($row=mysql_fetch_array($ketqua))
			{
			$maPXNVL = $row['maPXNVL'];
			$maLoNVL = $row['maLoNVL'];
			$tenNguyenVatLieu = $row['tenNguyenVatLieu'];
			$maNguyenVatLieu = $row['maNguyenVatLieu'];
			$donViTinh = $row['donViTinh'];
			$soLuong = $row['soLuong'];
			$NSX = $row['NSX'];
			$NHH = $row['NHH'];
			$maKe = $row['maKe'];
			$tenKe = $row['tenKe'];
			echo '  <tr>
                        <td>'.$dem.'</td> <!-- Số thứ tự -->
                        <td>'.$tenNguyenVatLieu.'</td> <!-- Tên sản phẩm -->
                        <td>'.$donViTinh.'</td> <!-- Đơn vị tính -->
                        <td>'.$soLuong.'</td> <!-- Số lượng -->
                        <td>'.$tenKe.'</td> <!-- Kệ -->
                        <td>'.$NSX.'</td> <!-- Ngày sản xuất -->
                        <td>'.$NHH.'</td> <!-- Hạn sử dụng -->
                    </tr>';
				$dem ++;
			}
		}
		else
		{
			echo 'Không có dữ liệu';
		}
		mysql_close($link);
	}
	
	
	public function xuatLoPhieuXTP($sql)
	{
		$link = $this -> connect();
		$ketqua = mysql_query($sql, $link);
		$i = mysql_num_rows($ketqua);
		if ($i >0)
		{
			$dem =1;
			while ($row=mysql_fetch_array($ketqua))
			{
			$maPXTP = $row['maPXTP'];
			$maLoTP = $row['maLoTP'];
			$tenThanhPham = $row['tenThanhPham'];
			$maThanhPham = $row['maThanhPham'];
			$donViTinh = $row['donViTinh'];
			$soLuong = $row['soLuong'];
			$NSX = $row['NSX'];
			$NHH = $row['NHH'];
			$maKe = $row['maKe'];
			$tenKe = $row['tenKe'];
			echo '  <tr>
                        <td>'.$dem.'</td> <!-- Số thứ tự -->
                        <td>'.$tenThanhPham.'</td> <!-- Tên sản phẩm -->
                        <td>'.$donViTinh.'</td> <!-- Đơn vị tính -->
                        <td>'.$soLuong.'</td> <!-- Số lượng -->
                        <td>'.$tenKe.'</td> <!-- Kệ -->
                        <td>'.$NSX.'</td> <!-- Ngày sản xuất -->
                        <td>'.$NHH.'</td> <!-- Hạn sử dụng -->
                    </tr>';
				$dem ++;
			}
		}
		else
		{
			echo 'Không có dữ liệu';
		}
		mysql_close($link);
	}
	public function xuatGhiChuPhieuXNVL($sql)
	{
		$link = $this -> connect();
		$ketqua = mysql_query($sql, $link);
		$i = mysql_num_rows($ketqua);
		if ($i >0)
		{
			$dem =1;
			while ($row=mysql_fetch_array($ketqua))
			{
			$maPXNVL = $row['maPXNVL'];
			$maLoNVL = $row['maLoNVL'];
			$tenNguyenVatLieu = $row['tenNguyenVatLieu'];
			$maNguyenVatLieu = $row['maNguyenVatLieu'];
			$donViTinh = $row['donViTinh'];
			$soLuong = $row['soLuong'];
			$NSX = $row['NSX'];
			$NHH = $row['NHH'];
			$maKe = $row['maKe'];
			$tenKe = $row['tenKe'];
			echo ' 
                        <td>'.$dem.'</td> <!-- Số thứ tự -->
                    </tr>';
				$dem ++;
			}
		}
		else
		{
			echo 'Không có dữ liệu';
		}
		mysql_close($link);
	}
	public function xuatdsbbbtnvl($sql)
	{
		$link = $this -> connect();
		$ketqua = mysql_query($sql, $link);
		$i = mysql_num_rows($ketqua);
		if ($i >0)
		{
			while ($row=mysql_fetch_array($ketqua))
			{
				$maBBBTNVL = $row['maBBBTNVL'];
				$tinhTrang = $row['tinhTrang'];
			
			echo '
            <a href="ChiTietBBBTNVL.php?maBBBTNVL='.$maBBBTNVL.'">
                <div class="kho-sub">'.$maBBBTNVL.' -  '.$tinhTrang.'</div>
				
            </a>
        ';
			}
		}
		else
		{
			echo 'Không có dữ liệu';
		}
		mysql_close($link);
	}
	
	public function xuatdsbbbttp($sql)
	{
		$link = $this -> connect();
		$ketqua = mysql_query($sql, $link);
		$i = mysql_num_rows($ketqua);
		if ($i >0)
		{
			while ($row=mysql_fetch_array($ketqua))
			{
				$maBBBTTP = $row['maBBBTTP'];
				$tinhTrang = $row['tinhTrang'];
			echo '
            <a href="ChiTietBBBTTP.php?maBBBTTP='.$maBBBTTP.'">
                <div class="kho-sub">'.$maBBBTTP.' -  '.$tinhTrang.'</div>
            </a>
        ';
			}
		}
		else
		{
			echo 'Không có dữ liệu';
		}
		mysql_close($link);
	}

	
	public function xuatCTBBBTNVL($sql)
	{
		$link = $this -> connect();
		$ketqua = mysql_query($sql, $link);
		$i = mysql_num_rows($ketqua);
		if ($i >0)
		{
			while ($row=mysql_fetch_array($ketqua))
			{
				// Lấy thông tin từ dữ liệu
			$maBBBTNVL = $row['maBBBTNVL'];
			$maPNNVL = $row['maPNNVL'];
			$ngayLap = $row['ngayLap'];
				
			echo '
				  <h1>BIÊN BẢN BỒI THƯỜNG</h1>
	<h2>Mã biên bản bồi thường: '.$maBBBTNVL.'</h2>
    <div class="warehouse">
        <div class="warehouse-information">
            <p><b>Ngày lập biên bản:</b> '.$ngayLap.'</p>
            <p><b>Mã phiếu nhập nguyên vật liệu:</b> '.$maPNNVL.'</p>
            <h2 style="text-align: center; font-size: 1.8em;"><b>Thông tin Biên Bản Bồi Thường</b></h2>
        </div>';
			}
		}
		else
		{
			echo 'Không có dữ liệu';
		}
		mysql_close($link);
	}
	
	public function xuatCTBBBTTP($sql)
	{
		$link = $this -> connect();
		$ketqua = mysql_query($sql, $link);
		$i = mysql_num_rows($ketqua);
		if ($i >0)
		{
			while ($row=mysql_fetch_array($ketqua))
			{
				// Lấy thông tin từ dữ liệu
			$maBBBTTP = $row['maBBBTTP'];
			$maPNTP = $row['maPNTP'];
			$ngayLap = $row['ngayLap'];
				
			echo '
				  <h1>BIÊN BẢN BỒI THƯỜNG</h1>
	<h2>Mã biên bản bồi thường: '.$maBBBTTP.'</h2>
    <div class="warehouse">
        <div class="warehouse-information">
            <p><b>Ngày lập biên bản:</b> '.$ngayLap.'</p>
            <p><b>Mã phiếu nhập nguyên vật liệu:</b> '.$maPNTP.'</p>
            <h2 style="text-align: center; font-size: 1.8em;"><b>Thông tin Biên Bản Bồi Thường</b></h2>
        </div>';
			}
		}
		else
		{
			echo 'Không có dữ liệu';
		}
		mysql_close($link);
	}
	
	public function xuatLoBBBTNVL($sql)
	{
		$link = $this -> connect();
		$ketqua = mysql_query($sql, $link);
		$i = mysql_num_rows($ketqua);
		$count =1;
		if ($i >0)
		{
			while ($row=mysql_fetch_array($ketqua))
			{
				// Lấy thông tin từ dữ liệu
			$maBBBTNVL = $row['maBBBTNVL'];
			$maLoNVL = $row['maLoNVL'];
			$tennguyenvatlieu = $row['tenNguyenVatLieu'];
			$donvitinh = $row['donViTinh'];
			$soluong = $row['soLuong'];
			$soluongthucte = $row['soLuongThucTe'];
			$nsx = $row['NSX'];
			$nhh = $row['NHH'];
			$ghichu = $row['lyDo'];

				
			echo '
				   <tr>
                        <td>'.$count++.'</td> <!-- Số thứ tự -->
						<td>'.$maLoNVL.'</td>
                        <td>'.$tennguyenvatlieu.'</td> <!-- Tên sản phẩm -->
                        <td>'.$donvitinh.'</td><!-- đơn vịi tính sản phẩm -->
                        <td>'.$soluong.'</td> <!-- số lượng trên phiếu -->
                        <td>'.$soluongthucte.'</td> <!-- Số lượng giao thực tế -->
                        <td>'.$nsx.'</td> <!-- Ngày sản xuất -->
                        <td>'.$nhh.'</td> <!-- Hạn sử dụng -->
                        <td>'.$ghichu.'</td><!-- ghi chú biên bản -->
                    </tr>';
			}
		}
		else
		{
			echo 'Không có dữ liệu';
		}
		mysql_close($link);
	}
	
	public function xuatLoBBBTTP($sql)
	{
		$link = $this -> connect();
		$ketqua = mysql_query($sql, $link);
		$i = mysql_num_rows($ketqua);
		$count =1;
		if ($i >0)
		{
			while ($row=mysql_fetch_array($ketqua))
			{
				// Lấy thông tin từ dữ liệu
			$maBBBTTP = $row['maBBBTTP'];
				$maLoTP = $row['maLoTP'];
			$tenThanhPham = $row['tenThanhPham'];
			$donvitinh = $row['donViTinh'];
			$soluong = $row['soLuong'];
			$soluongthucte = $row['soLuongThucTe'];
			$nsx = $row['NSX'];
			$nhh = $row['NHH'];
			$ghichu = $row['lyDo'];

				
			echo '
				   <tr>
                        <td>'.$count++.'</td> <!-- Số thứ tự -->
						<td>'.$maLoTP.'</td>
                        <td>'.$tenThanhPham.'</td> <!-- Tên sản phẩm -->
                        <td>'.$donvitinh.'</td><!-- đơn vịi tính sản phẩm -->
                        <td>'.$soluong.'</td> <!-- số lượng trên phiếu -->
                        <td>'.$soluongthucte.'</td> <!-- Số lượng giao thực tế -->
                        <td>'.$nsx.'</td> <!-- Ngày sản xuất -->
                        <td>'.$nhh.'</td> <!-- Hạn sử dụng -->
                        <td>'.$ghichu.'</td><!-- ghi chú biên bản -->
                    </tr>';
			}
		}
		else
		{
			echo 'Không có dữ liệu';
		}
		mysql_close($link);
	}
	
	public function xuatLienKetUPPHNVL($sql)
	{
		$link = $this -> connect();
		$ketqua = mysql_query($sql, $link);
		$i = mysql_num_rows($ketqua);
		$count =1;
		if ($i >0)
		{
			while ($row=mysql_fetch_array($ketqua))
			{
				// Lấy thông tin từ dữ liệu
			$maPNNVL = $row['maPNNVL'];
				
			echo '
				   <a href="UPPhieuNhapNVL.php?maPNNVL='.$maPNNVL.' "><button style="background-color: #39a867;">Cập nhật phiếu nhập</button></a>';
			}
		}
		else
		{
			echo 'Không có dữ liệu';
		}
		mysql_close($link);
	}
	
	public function xuatCTUDPhieuNNVL($sql)
	{
		$link = $this -> connect();
		$ketqua = mysql_query($sql, $link);
		$i = mysql_num_rows($ketqua);
		if ($i >0)
		{
			while ($row=mysql_fetch_array($ketqua))
			{
				// Lấy thông tin từ dữ liệu
			$maPNNVL = $row['maPNNVL'];
			$maNVKho = $row['maNVKho'];
			$tenNVKho = $row['tenNVKho'];
			$tenkho = $row['tenKho'];
			$tenNguoiGiao = $row['tenNguoiGiao'];
			$ngayNhap = $row['ngayNhap'];
			$ngayLap = $row['ngayLap'];
			$maBBBTNVL = $row['maBBBTNVL'];
			echo '
				 <h2>Mã phiếu: '.$maPNNVL.'</h2>
    <div class="warehouse">
        <div class="warehouse-information">
            <p><b>Tên người giao:</b> '.$tenNguoiGiao.'</p>
            <p><b>Ngày nhập:</b> '.$ngayNhap.'</p>
            <p><b>Kho nhập:</b> '.$tenkho.'</p>
            <p><b>Người lập Phiếu:</b> '.$tenNVKho.'</p>
            <p><b>Ngày lập Phiếu:</b> '.$ngayLap.'</p>
            <p><b>Mã biên bản bồi thường:</b> '.$maBBBTNVL.'</p>
            <h2 style="text-align: center; font-size: 1.8em;"><b>Danh sách hàng hóa</b></h2>
        </div>';
			}
		}
		else
		{
			echo 'Không có dữ liệu';
		}
		mysql_close($link);
	}
	
	
	public function xuatCTUDPhieuNTP($sql)
	{
		$link = $this -> connect();
		$ketqua = mysql_query($sql, $link);
		$i = mysql_num_rows($ketqua);
		if ($i >0)
		{
			while ($row=mysql_fetch_array($ketqua))
			{
				// Lấy thông tin từ dữ liệu
			$maPNTP = $row['maPNTP'];
			$maNVKho = $row['maNVKho'];
			$tenNVKho = $row['tenNVKho'];
			$tenkho = $row['tenKho'];
			$tenNguoiGiao = $row['tenNguoiGiao'];
			$ngayNhap = $row['ngayNhap'];
			$ngayLap = $row['ngayLap'];
			$maBBBTTP = $row['maBBBTTP'];
			echo '
				 <h2>Mã phiếu: '.$maPNTP.'</h2>
    <div class="warehouse">
        <div class="warehouse-information">
            <p><b>Tên người giao:</b> '.$tenNguoiGiao.'</p>
            <p><b>Ngày nhập:</b> '.$ngayNhap.'</p>
            <p><b>Kho nhập:</b> '.$tenkho.'</p>
            <p><b>Người lập Phiếu:</b> '.$tenNVKho.'</p>
            <p><b>Ngày lập Phiếu:</b> '.$ngayLap.'</p>
            <p><b>Mã biên bản bồi thường:</b> '.$maBBBTTP.'</p>
            <h2 style="text-align: center; font-size: 1.8em;"><b>Danh sách hàng hóa</b></h2>
        </div>';
			}
		}
		else
		{
			echo 'Không có dữ liệu';
		}
		mysql_close($link);
	}
	
	
	public function xuatLoUDBBBTNVL($sql)
	{
		$link = $this -> connect();
		$ketqua = mysql_query($sql, $link);
		$i = mysql_num_rows($ketqua);
		$count =1;
		if ($i >0)
		{
			while ($row=mysql_fetch_array($ketqua))
			{
				// Lấy thông tin từ dữ liệu
			$maBBBTNVL = $row['maBBBTNVL'];
			$tenNguyenVatLieu = $row['tenNguyenVatLieu'];
			$donViTinh	 = $row['donViTinh'];
			$tenKe = $row['tenKe'];
			$soLuongThucTe = $row['soLuongThucTe'];
			$NSX = $row['NSX'];
			$NHH = $row['NHH'];
			$lyDo = $row['lyDo'];

				
			echo '<tr>
                        <td>'.$count++.'</td> <!-- Số thứ tự -->
                        <td>'.$tenNguyenVatLieu.'</td> <!-- Tên sản phẩm -->
                        <td>'.$donViTinh	.'</td> <!-- Đơn vị tính -->
                        <td>'.$soLuongThucTe.'</td> <!-- Số lượng -->
                        <td>'.$tenKe.'</td> <!-- Kệ -->
                        <td>'.$NSX.'</td> <!-- Ngày sản xuất -->
                        <td>'.$NHH.'</td> <!-- Hạn sử dụng -->
                        <td>'.$lyDo.'</td>
                    </tr>';
			}
		}
		else
		{
			echo 'Không có dữ liệu';
		}
		mysql_close($link);
	}
	
	public function xuatLoUDBBBTTP($sql)
	{
		$link = $this -> connect();
		$ketqua = mysql_query($sql, $link);
		$i = mysql_num_rows($ketqua);
		$count =1;
		if ($i >0)
		{
			while ($row=mysql_fetch_array($ketqua))
			{
				// Lấy thông tin từ dữ liệu
			$maBBBTTP = $row['maBBBTTP'];
			$tenThanhPham = $row['tenThanhPham'];
			$donViTinh	 = $row['donViTinh'];
			$tenKe = $row['tenKe'];
			$soLuongThucTe = $row['soLuongThucTe'];
			$NSX = $row['NSX'];
			$NHH = $row['NHH'];
			$lyDo = $row['lyDo'];

				
			echo '<tr>
                        <td>'.$count++.'</td> <!-- Số thứ tự -->
                        <td>'.$tenThanhPham.'</td> <!-- Tên sản phẩm -->
                        <td>'.$donViTinh	.'</td> <!-- Đơn vị tính -->
                        <td>'.$soLuongThucTe.'</td> <!-- Số lượng -->
                        <td>'.$tenKe.'</td> <!-- Kệ -->
                        <td>'.$NSX.'</td> <!-- Ngày sản xuất -->
                        <td>'.$NHH.'</td> <!-- Hạn sử dụng -->
                        <td>'.$lyDo.'</td>
                    </tr>';
			}
		}
		else
		{
			echo 'Không có dữ liệu';
		}
		mysql_close($link);
	}
	
	public function themxoasua($sql)
	{
		$link = $this -> connect();
		if(mysql_query($sql, $link))
		{
			return 1;
		} else
		{
			return 0;
		}
	}

// =========================================================================
	public function xuatdsnvl($sql)
	{
		$link = $this -> connect();
		$ketqua = mysql_query($sql, $link);
		$i = mysql_num_rows($ketqua);
		if ($i >0)
		{
			while ($row=mysql_fetch_array($ketqua))
			{
				$manvl = $row['maNguyenVatLieu'];
				$tennvl = $row['tenNguyenVatLieu'];
				$anh=$row['anh'];
			echo '
           			 <a href="info_materials.php?maNguyenVatLieu='.$manvl.'"><img src="./uploads/'.$anh.'" alt="">'.$tennvl.'</a>
       			 ';
			}
		}
		else
		{
			echo 'Không có dữ liệu';
		}
		mysql_close($link);
	}
	
	public function xuatdstp($sql)
	{
		$link = $this -> connect();
		$ketqua = mysql_query($sql, $link);
		$i = mysql_num_rows($ketqua);
		if ($i >0)
		{
			while ($row=mysql_fetch_array($ketqua))
			{
				$matp = $row['maThanhPham'];
				$tentp = $row['tenThanhPham'];
				$anh=$row['anh'];
			echo '
           			 <a href="info_tp.php?maThanhPham='.$matp.'"><img src="./uploads/'.$anh.'" alt="">'.$tentp.'</a>
       			 ';
			}
		}
		else
		{
			echo 'Không có dữ liệu';
		}
		mysql_close($link);
	}

	public function count_total_uncomplete_form()
	{
		$result = mysql_query("SELECT *
		FROM bieumauxuat
		WHERE trangThai = ''
		UNION
		SELECT *
		FROM bieumaunhap
		WHERE trangThai = '';
		");
		$i= mysql_num_rows($result);
		return $i;
	}
	public function count_total_completed_form()
	{
		$result = mysql_query("SELECT *
		FROM bieumauxuat
		WHERE trangThai = 'Đã lập phiếu'
		UNION
		SELECT *
		FROM bieumaunhap
		WHERE trangThai = 'Đã lập phiếu';
		");
		$i= mysql_num_rows($result);
		return $i;
	}

	public function count_materials()
	{
		$result = mysql_query("SELECT SUM(soLuongTonnvl) 
		FROM nguyenvatlieu;
		");
		$row = mysql_fetch_row($result);
		$total = $row[0];
		return $total;
	}
	public function count_products()
	{
		$result = mysql_query("SELECT SUM(soLuongTon) 
		FROM thanhpham;
		");
		$row = mysql_fetch_row($result);
		$total = $row[0];
		return $total;
	}

	public function DSBMN($sql)
{
    $link = $this->connect();
    $result = mysql_query($sql, $link);
    $count = 1; // Đưa biến count ra khỏi vòng lặp để đếm số thứ tự
    if (mysql_num_rows($result) > 0) {
        while ($row = mysql_fetch_array($result)) {
            $maBMNhap = $row['maBMNhap'];
            $makho = $row['maKho'];
            $ngayNhap = $row['ngayNhap'];
            $loaiNhap = $row['loaiNhap'];
            $trangthai = $row['trangThai'];

            // Tạo đường dẫn tới trang phù hợp dựa trên giá trị của maKho
            if (strpos($makho, 'KNVL') !== false) {
                $url = 'info_bmn.php?idBMN=' . $maBMNhap;
            } elseif (strpos($makho, 'KTP') !== false) {
                $url = 'info_bmn.php?idBMN=' . $maBMNhap;
            } else {
                $url = '#'; // Đường dẫn mặc định nếu không phù hợp
            }

            echo '<tr>
                    <td>'.$count++.'</td> <!-- Số thứ tự -->
                    <td>'.$maBMNhap.'</td> 
                    <td>'.$makho.'</td> <!-- Đơn vị tính -->
                    <td>'.$ngayNhap.'</td> 
                    <td>'.$loaiNhap.'</td> 
                    <td class="">'.$trangthai.'</td> 
                    <td><a href="'.$url.'" class="btn btn-info ml-auto mr-auto">Xem chi tiết</a></td> <!-- Nút Xem chi tiết -->
                </tr>';
        }
    } else {
        echo 'Không có biểu mẫu xuất nào';
    }  
}



	public function DSBMX($sql)
{
    $link = $this->connect();
    $result = mysql_query($sql, $link);
    $count = 1; // Đưa biến count ra khỏi vòng lặp để đếm số thứ tự
    if (mysql_num_rows($result) > 0) {
        while ($row = mysql_fetch_array($result)) {
            $maBMXuat = $row['maBMXuat'];
            $makho = $row['maKho'];
            $ngayXuat = $row['ngayXuat'];
            $loaiXuat = $row['loaiXuat'];
            $trangthai = $row['trangThai'];

            // Tạo đường dẫn tới trang phù hợp dựa trên giá trị của maKho
            if (strpos($makho, 'KNVL') !== false) {
                $url = 'info_bmx.php?idBMX=' . $maBMXuat;
            } elseif (strpos($makho, 'KTP') !== false) {
                $url = 'info_bmx.php?idBMX=' . $maBMXuat;
            } else {
                $url = '#'; // Đường dẫn mặc định nếu không phù hợp
            }

            echo '<tr>
                    <td>'.$count++.'</td> <!-- Số thứ tự -->
                    <td>'.$maBMXuat.'</td> 
                    <td>'.$makho.'</td> <!-- Đơn vị tính -->
                    <td>'.$ngayXuat.'</td> 
                    <td>'.$loaiXuat.'</td> 
                    <td>'.$trangthai.'</td> 
                    <td><a href="'.$url.'" class="btn btn-info ml-auto mr-auto">Xem chi tiết</a></td> <!-- Nút Xem chi tiết -->
                </tr>';
        }
    } else {
        echo 'Không có biểu mẫu xuất nào';
    }  
}

public function DSSP($sql)
{
	$link = $this->connect();
	$result =mysql_query($sql, $link);
	$i = mysql_num_rows($result);
	$count = 1;
	if($i>0)
	{
		while($row=mysql_fetch_array($result)){
			$tenSP = $row['tenSanPham'];
			$soLuong = $row['soLuong'];
			$donViTinh = $row['donViTinh'];
			$nsx = $row['ngaySanXuat'];
			$nhh = $row['ngayHetHan'];
			echo '<tr>
			<td>'.$count++.'</td> <!-- Số thứ tự -->
			<td>'.$tenSP.'</td> <!-- Tên sản phẩm -->
			<td>'.$donViTinh.'</td> <!-- Đơn vị tính -->
			<td>'.$soLuong.'</td> <!-- Số lượng -->';
			if(!empty($nsx))
			{
				echo' <td>'.$nsx.'</td> <!-- Ngày sản xuất -->
				<td>'.$nhh.'</td> <!-- Hạn sử dụng -->
			</tr>';
			}
			else
			{
				echo '<td>Chưa có</td> <!-- Ngày sản xuất -->
				<td>Chưa có</td> <!-- Hạn sử dụng -->
			</tr>';
			}
			
		}
	}
}
public function DSLNVL($sql)
    {
        $link = $this->connect();
        $result =mysql_query($sql, $link);
        $i = mysql_num_rows($result);
        $count = 1;
        if($i>0)
        {
            while($row=mysql_fetch_array($result)){
                $tenSP = $row['tenNguyenVatLieu'];
                $soLuong = $row['soLuong'];
                $donViTinh = $row['donViTinh'];
                $nsx = $row['NSX'];
                $nhh = $row['NHH'];
                echo '<tr>
                <td>'.$count++.'</td> <!-- Số thứ tự -->
                <td>'.$tenSP.'</td> <!-- Tên sản phẩm -->
                <td>'.$donViTinh.'</td> <!-- Đơn vị tính -->
                <td>'.$soLuong.'</td> <!-- Số lượng -->
                <td>'.$nsx.'</td> <!-- Ngày sản xuất -->
                <td>'.$nhh.'</td> <!-- Hạn sử dụng -->
                </tr>';
                
            }
        }
    }

    public function DSTP($sql)
    {
        $link = $this->connect();
        $result =mysql_query($sql, $link);
        $i = mysql_num_rows($result);
        $count = 1;
        if($i>0)
        {
            while($row=mysql_fetch_array($result)){
                $tenSP = $row['tenThanhPham'];
                $soLuong = $row['soLuong'];
                $donViTinh = $row['donViTinh'];
                $nsx = $row['NSX'];
                $nhh = $row['NHH'];
                echo '<tr>
                <td>'.$count++.'</td> <!-- Số thứ tự -->
                <td>'.$tenSP.'</td> <!-- Tên sản phẩm -->
                <td>'.$donViTinh.'</td> <!-- Đơn vị tính -->
                <td>'.$soLuong.'</td> <!-- Số lượng -->
                <td>'.$nsx.'</td> <!-- Ngày sản xuất -->
                <td>'.$nhh.'</td> <!-- Hạn sử dụng -->
                </tr>';
                
            }
        }
    }

	// =========================================================================
	// Phòng kế hoạch
	public function DSDH($sql)
	{
		$link = $this->connect();
		$result = mysql_query($sql, $link);
		$count = 1; // Đưa biến count ra khỏi vòng lặp để đếm số thứ tự
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
						<td><a href="create_plan_manu.php?idDH='.$maDonHang.'" class="btn btn-info">Lập kế hoạch</a></td> <!-- Nút Xem chi tiết -->
					</tr>';
			}
		} else {
			echo 'Không có biểu mẫu xuất nào';
		}  
	}

	
 	public function list_product($sql)
    {
        $link = $this->connect();
        $result =mysql_query($sql, $link);
        $i = mysql_num_rows($result);
        $count = 1;
        if($i>0)
        {
            while($row=mysql_fetch_array($result)){
				$maThanhPham =$row['maThanhPham'];
                $tenThanhPham = $row['tenThanhPham'];
                $soLuongTon = $row['soLuongTon'];
				$donViTinh = $row['donViTinh'];
				echo '<tr>
				<td>'.$count++.'</td>
				<td>'.$maThanhPham.'</td>
				<td>'.$tenThanhPham.'</td>
				<td>'.$donViTinh.'</td>
				<td>'.$soLuongTon.'</td>
				<td class="text-center"><input type="checkbox" name="selected_products[]" value="'.$maThanhPham.'"></td>
			  </tr>';
		
                
            }
        }
    }

	public function list_material($sql)
    {
        $link = $this->connect();
        $result =mysql_query($sql, $link);
        $i = mysql_num_rows($result);
        $count = 1;
        if($i>0)
        {
            while($row=mysql_fetch_array($result)){
				$maNguyenVatLieu =$row['maNguyenVatLieu'];
                $tenNguyenVatLieu = $row['tenNguyenVatLieu'];
                $soLuongTonnvl = $row['soLuongTonnvl'];
				$donViTinh = $row['donViTinh'];
				echo '<tr>
				<td>'.$count++.'</td>
				<td>'.$maNguyenVatLieu.'</td>
				<td>'.$tenNguyenVatLieu.'</td>
				<td>'.$donViTinh.'</td>
				<td>'.$soLuongTonnvl.'</td>
				<td class="text-center"><input type="checkbox" name="selected_materials[]" value="'.$maNguyenVatLieu.'"></td>
			  </tr>';
		
                
            }
        }
    }

	public function list_propose($sql)
    {
        $link = $this->connect();
        $result =mysql_query($sql, $link);
        $i = mysql_num_rows($result);
        $count = 1;
        if($i>0)
        {
            while($row=mysql_fetch_array($result)){
				$maDeXuat =$row['maDeXuat'];
                $tenDeXuat = $row['tenDeXuat'];
				$trangThai = $row['trangThai'];
				$url = 'propose_info.php?idDX=' . $maDeXuat;
				echo '<tr>
				<td>'.$count++.'</td>
				<td>'.$maDeXuat.'</td>
				<td>'.$tenDeXuat.'</td>
				<td>'.$trangThai.'</td>
				<td><a href="'.$url.'" class="btn btn-info ml-auto mr-auto">Xem chi tiết</a></td> <!-- Nút Xem chi tiết -->
			  </tr>';
		
                
            }
        }
    }

	
	
	// =========================================================================
	public function bieuDoNguyenVatLieu($sql)
{
    $link = $this->connect();
    $ketqua = mysql_query($sql, $link);
    $labels = array();
    $data = array();
    $i = mysql_num_rows($ketqua);
    if ($i > 0) {
        while ($row = mysql_fetch_array($ketqua)) {
            $labels[] = $row['tenNguyenVatLieu'];
            $data[] = $row['soLuongTonnvl'];
        }

        mysql_close($link);
    } else {
        echo 'Lỗi thực thi truy vấn.';
    }

    return array('labels' => $labels, 'data' => $data);
}
public function bieuDo($sql)
{
    $link = $this->connect();
    $ketqua = mysql_query($sql, $link);
    $labels = array();
    $data = array();
    $i = mysql_num_rows($ketqua);
	if ($i >0) {
     while ($row = mysql_fetch_array($ketqua)) {
            $labels[] =$row['tenThanhPham'];
            $data[] = $row['soLuongTon'];
        }

        mysql_close($link);
		
    } else {
        echo 'Lỗi thực thi truy vấn.';
    }
	var_dump($labels);
	var_dump($data);
    return array('labels' => $labels, 'data' => $data);

}

public function list_propose_gd($sql)
    {
        $link = $this->connect();
        $result =mysql_query($sql, $link);
        $i = mysql_num_rows($result);
        $count = 1;
        if($i>0)
        {
            while($row=mysql_fetch_array($result)){
				$maDeXuat =$row['maDeXuat'];
                $tenDeXuat = $row['tenDeXuat'];
				$trangThai = $row['trangThai'];
				$url = 'accept_propose.php?idDX=' . $maDeXuat;
				echo '<tr>
				<td>'.$count++.'</td>
				<td>'.$maDeXuat.'</td>
				<td>'.$tenDeXuat.'</td>';
				if($trangThai=="Chờ duyệt")
				{
					echo '<td class="badge badge-warning d-flex justify-content-center mt-3">'.$trangThai.'</td>';
				}
				else
				{
					echo '<td class="badge badge-primary d-flex justify-content-center mt-3">'.$trangThai.'</td>';
				}
				echo '<td><a href="'.$url.'" class="btn btn-info ml-auto mr-auto">Xem chi tiết</a></td> <!-- Nút Xem chi tiết -->
			  </tr>';
		
                
            }
        }
    }


	public function accept_propose($sql)
	{
		$link = $this->connect();
		$result = mysql_query($sql,$link);
		$i = mysql_num_rows($result);
		$count =1;
		if($i>0)
		{
			while($row=mysql_fetch_array($result))
			{
				$maNguyenVatLieu = $row['maNguyenVatLieu'];
				$tenNguyenVatLieu = $row['tenNguyenVatLieu'];
				$soLuongTrongKho =$row['soLuongTonnvl'];
				$soLuongNhapThem = $row['soLuong'];
				echo '<tr>
				<td>'.$count++.'</td>
				<td>'.$maNguyenVatLieu.'</td>
				<td>'.$tenNguyenVatLieu.'</td>
				<td>'.$soLuongTrongKho.'</td>
				<td><strong>'.$soLuongNhapThem.'</strong></td>
			  </tr>';

			}
		}
	}
	// ============BOTCHAT============
	public function countPNNVL() {
		$result = mysql_query("SELECT * FROM phieunnvl", $this->connect());
		$i = mysql_num_rows($result);
		return $i;
	}
	public function countPXNVL() {
		$result = mysql_query("SELECT * FROM phieuxnvl", $this->connect());
		$i = mysql_num_rows($result);
		return $i;
	}
	public function countPNTP() {
		$result = mysql_query("SELECT * FROM phieuntp", $this->connect());
		$i = mysql_num_rows($result);
		return $i;
	}
	public function countPXTP() {
		$result = mysql_query("SELECT * FROM phieuxtp", $this->connect());
		$i = mysql_num_rows($result);
		return $i;
	}
	public function countDonhang() {
		$result = mysql_query("SELECT * FROM donhang", $this->connect());
		$i = mysql_num_rows($result);
		return $i;
	}
	public function countNVL(){
		$result= mysql_query("SELECT * FROM nguyenvatlieu", $this->connect());
		$i = mysql_num_rows($result);
		return $i;
	}
	public function countNVLton(){
		$result= mysql_query("SELECT SUM(SoLuongTonnvl) AS total FROM nguyenvatlieu", $this->connect());
		$row = mysql_fetch_row($result);
		$total = $row[0];
		return $total;
	}
	
	public function countTP(){
		$result= mysql_query("SELECT * FROM thanhpham", $this->connect());
		$i = mysql_num_rows($result);
		return $i;
	}
	public function countTPton(){
		$result= mysql_query("SELECT SUM(soLuongTon) AS total FROM thanhpham", $this->connect());
		$row = mysql_fetch_row($result);
		$total = $row[0];
		return $total;
	}
	public function countKho(){
		$result= mysql_query("SELECT * FROM kho", $this->connect());
		$i = mysql_num_rows($result);
		return $i;
	}
	public function countKhonvl(){
		$result= mysql_query("SELECT * FROM kho WHERE maKho LIKE 'KNVL%'", $this->connect());
		$i = mysql_num_rows($result);
		return $i;
	}
	public function countKhotp(){
		$result= mysql_query("SELECT * FROM kho WHERE maKho LIKE 'KTP%'", $this->connect());
		$i = mysql_num_rows($result);
		return $i;
	}
	
	//giám đốc
	//nvl
	public function countphieuDuyet(){
		$result= mysql_query("SELECT * FROM phieuycxnvl WHERE tinhTrang LIKE 'Duyệt%'", $this->connect());
		$i = mysql_num_rows($result);
		return $i;
	}
	public function countphieuTC(){
		$result= mysql_query("SELECT * FROM phieuycxnvl WHERE tinhTrang LIKE 'Từ chối%'", $this->connect());
		$i = mysql_num_rows($result);
		return $i;
	}
	public function countphieuCD(){
		$result= mysql_query("SELECT * FROM phieuycxnvl WHERE tinhTrang LIKE 'Chưa Duyệt%'", $this->connect());
		$i = mysql_num_rows($result);
		return $i;
	}
	//tp
	public function countphieuDuyetTP(){
		$result= mysql_query("SELECT * FROM phieuycntp WHERE tinhTrang LIKE 'Duyệt%'", $this->connect());
		$i = mysql_num_rows($result);
		return $i;
	}
	public function countphieuTCTP(){
		$result= mysql_query("SELECT * FROM phieuycntp WHERE tinhTrang LIKE 'Từ chối%'", $this->connect());
		$i = mysql_num_rows($result);
		return $i;
	}
	public function countphieuCDTP(){
	$result= mysql_query("SELECT * FROM phieuycntp WHERE tinhTrang LIKE 'Chưa Duyệt%'", $this->connect());
	$i = mysql_num_rows($result);
	return $i;
}
public function countKHSX(){
	$result= mysql_query("SELECT * FROM kehoachsx", $this->connect());
	$i = mysql_num_rows($result);
	return $i;
}
public function countBBKK(){
	$result= mysql_query("SELECT * FROM bienbankiemke", $this->connect());
	$i = mysql_num_rows($result);
	return $i;
}
public function countYCNTP() {
	$result = mysql_query("SELECT * FROM phieuycntp", $this->connect());
	$i = mysql_num_rows($result);
	return $i;
}
public function countYCXNVL() {
	$result = mysql_query("SELECT * FROM phieuycxnvl", $this->connect());
	$i = mysql_num_rows($result);
	return $i;
}



}

?>