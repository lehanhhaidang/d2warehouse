<?php
if (isset($_REQUEST['idBMN'])) {
  $idBMN = $_REQUEST['idBMN'];
}
?>

<form method="post" enctype="multipart/form-data" name="form1" id="form1">
      <input type="hidden" name="maNV" value="<?php echo $p->pickColumn("SELECT nk.maNhanVien FROM bieumaunhap bn 
                 INNER JOIN kho k ON bn.maKho = k.maKho
                 INNER JOIN nhanvienkho nk ON k.maNVKho = nk.maNhanVien
                 WHERE bn.maBMNhap = '$idBMN'"); ?>">
      <h2 class="title" style="text-align:center;">Lập phiếu nhập thành phẩm</h2>
      <div class="body">
        <?php
        $rowCounted = $p->countRow("select * from phieuntp");
        $maPhieuNTP = "PNTP" . str_pad($rowCounted + 1, 2, "0", STR_PAD_LEFT);
        ?>
        <h4 class="codeForm">Mã phiếu:<?php echo $maPhieuNTP ?></h4>
        <div class="input-container col-md-5">
          <label class="labelInput" for="">Tên người giao</label>
          <input class="input form-control" name="tennguoigiao" value="<?php echo $p->pickColumn("select tenNguoiGiao from bieumaunhap
            where maBMNhap = '$idBMN' limit 1"); ?>" readonly >
        </div>
        <div class="input-container col-md-5">
          <label class="labelInput" for="">Ngày nhập</label>
          <input class="input form-control" name="ngaynhap" value="<?php echo $p->pickColumn("select ngayNhap from bieumaunhap
            where maBMNhap = '$idBMN' limit 1"); ?>" readonly  />
        </div>
        <div class="input-container col-md-5">
          <label class="labelInput" for="">Kho nhập</label>
          <input class="input form-control" name="khonhap" value="<?php echo $p->pickColumn("SELECT kho.tenKho
                            FROM bieumaunhap
                            INNER JOIN kho ON bieumaunhap.maKho = kho.maKho
                            WHERE bieumaunhap.maBMNhap = '$idBMN'"); ?>" readonly required/>
        </div>
        <div class="input-container col-md-5">
          <label class="labelInput" for="">Người lập phiếu</label>
          <input class="input form-control" name="nguoilap" value="<?php echo $p->pickColumn("SELECT nk.tenNVKho FROM bieumaunhap bn 
                 INNER JOIN kho k ON bn.maKho = k.maKho
                 INNER JOIN nhanvienkho nk ON k.maNVKho = nk.maNhanVien
                 WHERE bn.maBMNhap = '$idBMN' "); ?>" readonly />
        </div>
        <div class="input-container col-md-5">
          <label class="labelInput" for="">Ngày lập phiếu</label>
          <input type="date" name="ngaylap" class="input form-control" required />
        </div>
        <br>
        <br>
        <div class="table" id="table">
          <table class="table table-bordered">
            <tr>
              <th class="custom-cell">STT</th>
              <th class="custom-cell">Tên</th>
              <th class="custom-cell">Đơn vị</th>
              <th class="custom-cell">Số lượng</th>
              <th class="custom-cell">NSX</th>
              <th class="custom-cell">NHH</th>

            </tr>
            <?php
            $link = $p->connect();
            $sql = "SELECT * FROM chitietbieumaunhap WHERE maBMNhap = '$idBMN'";
            $result = mysqli_query($link,$sql);

            if (mysqli_num_rows($result) > 0) {
                $count =1;
              while ($row = mysqli_fetch_array($result)) {
                $tenSP = $row['tenSanPham'];
                $soLuong = $row['soLuong'];
                $donViTinh = $row['donViTinh'];

                echo '<tr>
                <td class="custom-cell" name="dem">' . $count++ . '</td>
                <td class="custom-cell" name="tenSP">' . $tenSP . '</td>
                <td class="custom-cell" name="donvitinh">' . $donViTinh . '</td>
                <td class="custom-cell" name="soluong">' . $soLuong . '</td>
                <td class="custom-cell"><input type="date" name="nsx[]" required></td>
                <td class="custom-cell"><input type="date" name="nhh[]" required></td>

            </tr>';
              }
            } else {
              echo "Không có dữ liệu.";
            }
            ?>

          </table>
        </div>
        <div class="btn">
          <input type="submit" class="buttonCancel" name="button" id="button" value="Quay lại" onclick="history.back()">
          <input type="submit" class="buttonCreate" name="button" id="button" value="Lập phiếu">

        </div>
      </div>

      <?php
      switch ($_POST['button']) {
        case "Lập phiếu": {

            $tenNguoiGiao = $_REQUEST['tennguoigiao'];
            $ngayNhap = $_REQUEST['ngaynhap'];
            $ngayLap = $_REQUEST['ngaylap'];
            $maNV = $_REQUEST['maNV'];
            $ngayHienTai = date("Y-m-d");
            $maKho = $p->pickColumn("select maKho from bieumaunhap where maBMNhap = '$idBMN'");
            $lapPhieu = $p->InsertUpdate("INSERT INTO phieuntp(maPNTP,maKho,maNVKho,tenNguoiGiao,ngayNhap,ngayLap) 
                VALUES('$maPhieuNTP','$maKho','$maNV','$tenNguoiGiao','$ngayNhap','$ngayLap')");

                
            if ($lapPhieu == 1 && $ngayLap == $ngayHienTai) {
              $count = 0;
              $link = $p->connect();
              $sql = "SELECT * FROM chitietbieumaunhap WHERE maBMNhap = '$idBMN'";
              $result = mysqli_query($link,$sql);
              if (mysqli_num_rows($result) > 0) {
                while ($row = mysqli_fetch_array($result)) {
                  
                  $tenSP = $row['tenSanPham'];
                  $soLuong = $row['soLuong'];
                  $donViTinh = $row['donViTinh'];  
                  $NSX = $_POST['nsx'][$count]; // Lấy giá trị của NSX từ form
                  $NHH = $_POST['nhh'][$count]; // Lấy giá trị của NHH từ form
                  $laySLT = $p->pickColumn("select soLuongTon from thanhpham where tenThanhPham = '$tenSP'");
                  $sltMoi = $soLuong + $laySLT;
                  $rowCounted = $p->countRow("select * from lothanhpham");
                  $maLoNVL = "LNVL" . str_pad($rowCounted + 1, 2, "0", STR_PAD_LEFT);
                  $maNVL =$p->pickColumn("select maThanhPham from thanhpham where tenThanhPham = '$tenSP'");
                    if($p->InsertUpdate("INSERT INTO lothanhpham (maLoTP,maThanhPham,maBMNhap,maPNTP,soLuong,NSX,NHH) 
                    VALUES ('$maLoNVL','$maNVL','$idBMN','$maPhieuNTP','$soLuong','$NSX','$NHH')")==1)
                    {
                      if($NSX < $NHH)
                      {
                        $count++;
                        $p->InsertUpdate("Update bieumaunhap set trangThai = 'Đã lập phiếu' where maBMNhap = '$idBMN' ");
                        if($p->InsertUpdate("UPDATE thanhpham SET soLuongTon = $sltMoi WHERE tenThanhPham = '$tenSP'")== 1)
                        {
                          echo '<script>alert("Lập phiếu thành công")</script>';
                          echo '<script> window.location="../NHANVIENKHO/TrangChuNVK.php" </script>';
                        }
                        else
                        {
                          echo '<script>alert("Lỗi set số lượng tồn")</script>';
                        }  
                      }
                      else
                      {
                        echo  '<script>alert("Ngày sản xuất phải nhỏ hơn ngày hết hạn")</script>';
                        $p-> InsertUpdate("DELETE FROM phieuntp where maPNTP = '$maPhieuNTP'");
                       $p->InsertUpdate("DELETE FROM lothanhpham where maLoNVL = '$maLoNVL'");
                       echo '<script> window.location="../NHANVIENKHO/LapPhieuNhapNVL.php?idBMN='.$idBMN.'"</script>';

                      }

                    }
       
                }
 
              }
  
          }
          else
          {
            echo '<script>alert("Ngày lập phiếu phải là ngày hiện tại")</script>';
            $p-> InsertUpdate("DELETE FROM phieuntp where maPNTP = '$maPhieuNTP'");
            echo '<script> window.location="../NHANVIENKHO/LapPhieuNhapNVL.php?idBMN='.$idBMN.'"</script>';
          }

          break;
      }

      }


      ?>

  </form>