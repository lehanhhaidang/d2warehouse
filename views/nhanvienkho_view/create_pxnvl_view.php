<?php
if (isset($_REQUEST['idBMX'])) {
    $idBMX = $_REQUEST['idBMX'];
  }
  
?>

<form method="post" enctype="multipart/form-data" name="form1" id="form1">
      <input type="hidden" name="maNV" value="<?php echo $p->pickColumn("SELECT nk.maNhanVien FROM bieumauxuat bn 
                 INNER JOIN kho k ON bn.maKho = k.maKho
                 INNER JOIN nhanvienkho nk ON k.maNVKho = nk.maNhanVien
                 WHERE bn.maBMXuat = '$idBMX'"); ?>">
      <h2 class="title" style ="text-align:center;"> Lập phiếu xuất nguyên vật liệu</h2>
      <div class="body">
        <?php
        $rowCounted = $p->countRow("select * from phieuxnvl");
        $maPhieuXNVL = "PXNVL" . str_pad($rowCounted + 1, 2, "0", STR_PAD_LEFT);
        ?>
        <h4 class="codeForm">Mã phiếu:<?php echo $maPhieuXNVL ?></h4>
        <div class="input-container col-md-5">
          <label class="labelInput" for="">Tên người nhận</label>
          <input class="input form-control" name="tennguoinhan" value="<?php echo $p->pickColumn("select tenNguoiNhan from bieumauxuat
            where maBMXuat = '$idBMX' limit 1"); ?>" readonly>
        </div>
        <div class="input-container col-md-5">
          <label class="labelInput" for="">Ngày xuất</label>
          <input class="input form-control" name="ngayxuat" value="<?php echo $p->pickColumn("select ngayXuat from bieumauxuat
            where maBMXuat = '$idBMX' limit 1"); ?>" readonly />
        </div>
        <div class="input-container col-md-5">
          <label class="labelInput" for="">Kho xuất</label>
          <input class="input form-control" name="khonhap" value="<?php echo $p->pickColumn("SELECT kho.tenkho
                            from longuyenvatlieu lgl
                            inner join kho on lgl.maKho = kho.maKho
                            WHERE lgl.maBMXuat = '$idBMX'"); ?>" readonly />
        </div>
        <div class="input-container col-md-5">
          <label class="labelInput" for="">Người lập phiếu</label>
          <input class="input form-control" name="nguoilap" value="<?php echo $p->pickColumn("SELECT nk.tenNVKho FROM longuyenvatlieu bn
                 INNER JOIN kho k ON bn.maKho = k.maKho
                 INNER JOIN nhanvienkho nk ON k.maNVKho = nk.maNhanVien
                 WHERE bn.maBMXuat = '$idBMX' "); ?>" readonly />
        </div>
        <div class="input-container col-md-5">
          <label class="labelInput" for="">Ngày lập phiếu</label>
          <input type="date" name="ngaylap" class="input form-control" required />
        </div>
        <br>
        <br>
        <div class="table" id="table">
          <table class="table table-bordered table-hover">
            <thead>
            <tr>
              <th class="custom-cell">STT</th>
              <th class="custom-cell">Tên</th>
              <th class="custom-cell">Đơn vị</th>
              <th class="custom-cell">Số lượng</th>
              <th class="custom-cell">NSX</th>
              <th class="custom-cell">NHH</th>
            </tr>
            </thead>
            <?php
            $link = $p->connect();
            $sql = "SELECT
            nv.tenNguyenVatLieu,
            lgl.soLuong,
            nv.donViTinh,
            lgl.NSX,
            lgl.NHH
        FROM
            bieumauxuat bmx
            JOIN longuyenvatlieu lgl ON bmx.maBMXuat = lgl.maBMXuat
            JOIN nguyenvatlieu nv ON lgl.maNguyenVatLieu = nv.maNguyenVatLieu
        WHERE
            bmx.maBMXuat = '$idBMX'";
            $result = mysqli_query($link,$sql);
                $count =1;
              while ($row = mysqli_fetch_array($result)) {
                $tenSP = $row['tenNguyenVatLieu'];
                $soLuong = $row['soLuong'];
                $donViTinh = $row['donViTinh'];
                $nsx = $row['NSX'];
                $nhh = $row['NHH'];

                echo '<tr>
                <td class="custom-cell" name="dem">' . $count++ . '</td>
                <td class="custom-cell" name="tenSP">' . $tenSP . '</td>
                <td class="custom-cell" name="donvitinh">' . $donViTinh . '</td>
                <td class="custom-cell" name="soluong">' . $soLuong . '</td>
                <td class="custom-cell" name = "nsx">'.$nsx.'</td>
                <td class="custom-cell" name = "nhh">'.$nhh.'</td>
    
            </tr>';
              }

            ?>

          </table>
        </div>
        <div class="btn justify-content-center d-block">
          <input type="submit" style="margin-right:50px;" class="buttonCancel btn btn-danger" name="button" id="button" value="Quay lại" onclick="history.back()">
          <input type="submit" class="buttonCreate btn btn-primary" name="button" id="button" value="Lập phiếu">

        </div>
      </div>

      <?php
      switch ($_POST['button']) {
        case "Lập phiếu": {

            $tenNguoiNhan = $_REQUEST['tennguoinhan'];
            $ngayxuat = $_REQUEST['ngayxuat'];
            $ngayLap = $_REQUEST['ngaylap'];
            $maNV = $_REQUEST['maNV'];
            $ngayHienTai = date("Y-m-d");

            $maKho = $p->pickColumn("select maKho from longuyenvatlieu where maBMXuat = '$idBMX'");
            $lapPhieu = $p->InsertUpdate("INSERT INTO phieuxnvl(maPXNVL,maKho,maNVKho,tenNguoiNhan,ngayxuat,ngayLap) 
                VALUES('$maPhieuXNVL','$maKho','$maNV','$tenNguoiNhan','$ngayxuat','$ngayLap')");

            if ($lapPhieu == 1 && $ngayLap == $ngayHienTai) {
              $count = 0;
              $link = $p->connect();
              $sql = "SELECT
              nv.tenNguyenVatLieu,
              lgl.soLuong,
              nv.donViTinh,
              lgl.NSX,
              lgl.NHH
          FROM
              bieumauxuat bmx
              JOIN longuyenvatlieu lgl ON bmx.maBMXuat = lgl.maBMXuat
              JOIN nguyenvatlieu nv ON lgl.maNguyenVatLieu = nv.maNguyenVatLieu
          WHERE
              bmx.maBMXuat = '$idBMX'";
              $result = mysqli_query($link,$sql);
              if (mysqli_num_rows($result) > 0) {
                while ($row = mysqli_fetch_array($result)) {
                  
                  $tenSP = $row['tenNguyenVatLieu'];
                  $soLuong = $row['soLuong'];
                  $donViTinh = $row['donViTinh'];  
                  $NSX = $row['NSX'];
                  $NHH = $row['NHH'];
                  $laySLT = $p->pickColumn("select soLuongTonnvl from nguyenvatlieu where tenNguyenVatLieu = '$tenSP'");
                  $sltMoi =   $laySLT - $soLuong;
                  $rowCounted = $p->countRow("select * from longuyenvatlieu");
                  $maLoNVL = "LNVL" . str_pad($rowCounted + 1, 2, "0", STR_PAD_LEFT);
                  $maNVL =$p->pickColumn("select maNguyenVatLieu from nguyenvatlieu where tenNguyenVatLieu = '$tenSP'");
                      if($p->InsertUpdate("UPDATE nguyenvatlieu SET soLuongTonnvl = $sltMoi WHERE tenNguyenVatLieu = '$tenSP'")== 1)
                      {
                        $p->InsertUpdate("Update bieumauxuat set trangThai = 'Đã lập phiếu' where maBMXuat = '$idBMX' ");
                        $p->InsertUpdate("UPDATE longuyenvatlieu set maPXNVL = '$maPhieuXNVL' where maBMXuat = '$idBMX'");
                        echo '<script>';
                        echo 'window.onload = function() { $("#successModal").modal("show"); };';
                        echo '</script>';
                      }
                      else
                      {
                        echo '<script>alert("Lỗi cơ sở dữ liệu")</script>';
                      }  
                }
              }
              else
              {
                echo '<script>alert("Lập phiếu thất bại")</script>';
                echo '<script> window.location="../d2warehouse/create_pxnvl.php?idBMX='.$idBMX.'"</script>';
              } 
          }
          else
          {
            echo '<script>alert("Ngày lập phiếu phải là ngày hiện tại")</script>';
            $p->InsertUpdate("DELETE FROM phieuxnvl where maPXNVL = '$maPhieuXNVL'");
            echo '<script> window.location="../d2warehouse/create_pxnvl.php?idBMX='.$idBMX.'"</script>';
          }
          break;
      }

      }
       ?>


  </main>

  </form>

  <div class="modal fade" id="successModal" tabindex="-1" role="dialog" aria-labelledby="successModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="successModalLabel">Thông báo</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        Thành công!
      </div>
      <div class="modal-footer">
        <a href="list_bmx.php" class="btn btn-primary">Xác nhận</a>
      </div>
    </div>
  </div>
</div>