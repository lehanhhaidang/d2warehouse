
<?php 
if(isset($_REQUEST['id']))
{
    $id = $_REQUEST['id'];
}
?>
<form action="" method="post">
<div class="button">
    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">Thêm kho</button>
</div>
<br>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th class="text-center">Tên kho</th>
                    <th class="text-center">Nhân viên phụ trách</th>
                    <th class="text-center">Địa chỉ</th>
                    <th class="text-center">Sức chứa</th>
                    <th class="text-center">Tình trạng</th>
                    <th class="text-center">Tùy chọn</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <input type="hidden" name="idchon" id="idchon" value="<?php echo $id ?>"></td>
                    <td>
                    <select name="txtkho" id="txtkho" class="input form-control">
                        <?php
                        // Kiểm tra xem $id có chứa chuỗi 'KNVL' hay 'KTP' hay không
                        if(strpos($id, 'KNVL') !== false) {
                            // Nếu có, đặt tên kho là "Kho nguyên vật liệu" và chọn mặc định
                            $tenKho = "Kho nguyên vật liệu";
                            $selected_KNVL = "selected";
                        } elseif(strpos($id, 'KTP') !== false) {
                            // Nếu có, đặt tên kho là "Kho thành phẩm" và chọn mặc định
                            $tenKho = "Kho thành phẩm";
                            $selected_KTP = "selected";
                        }
                        // Tạo các tùy chọn cho select box
                        echo "<option value='Kho nguyên vật liệu' $selected_KNVL>Kho nguyên vật liệu</option>";
                        echo "<option value='Kho thành phẩm' $selected_KTP>Kho thành phẩm</option>";
                        ?>
                    </select>
                 </td>

                    <td>
                    <select name="txtnvk" id="txtnvk" class="input form-control">
                        <?php
                        // Thực hiện truy vấn để lấy danh sách các nhân viên
                        $sql = "SELECT k.maNVKho, nvk.tenNVKho FROM kho k JOIN nhanvienkho nvk ON k.maNVKho = nvk.maNhanVien GROUP BY tenNVKho";
                        $result = mysqli_query($p->connect(), $sql);
                        $nhanvienkho = $p->pickColumn("select tenNVKho from kho join nhanvienkho on kho.maNVKho = nhanvienkho.maNhanVien where maKho = '$id' limit 1 ");
                        // Kiểm tra kết quả và hiển thị trong dropdown
                        if ($result->num_rows > 0) {
                            while($row = $result->fetch_assoc()) {
                                $selected = ""; // Khởi tạo biến selected để không có tùy chọn nào được chọn mặc định
                                if ($row['tenNVKho'] == $nhanvienkho) { // Thay currentEmployeeName bằng biến chứa tên nhân viên hiện tại
                                    $selected = "selected"; // Đặt thuộc tính selected nếu là nhân viên hiện tại
                                }
                                echo "<option value='". $row['tenNVKho'] ."' $selected>" . $row['tenNVKho'] . "</option>";
                            }
                        } else {
                            echo "<option value=''>Không có nhân viên nào</option>";
                        }
                        ?>
                    </select>
                    </td>
                    <td><input name="txtdiachi" type="text" id="txtdiachi" class="input form-control" value="<?php echo $p->pickColumn("select diaChiKho from kho where maKho = '$id' limit 1 ");?>"></td>
                    <td><input name="txtsucchua" type="text" id="txtsucchua" class="input form-control" value="<?php echo $p->pickColumn("select dungLuongKhoToiDa from kho where maKho = '$id' limit 1 ");?>"></td>
                    <td><select name="txttinhtrang" id="txttinhtrang" class="input form-control">
                        <option value="Hoạt động">Hoạt động</option>
                        <option value="Ngưng hoạt động">Ngưng hoạt động</option>
                    </select>
                    </td>
                    <td>
                        <button type="submit" class="btn btn-success" name="button" value="Sửa">Sửa</button>
                        <button type="submit" class="btn btn-danger" name="button" value="Xóa">Xóa</button>                    
                    </td>
                </tr>
            </tbody>
        </table>
        <div class="text-center">
            <?php
            $p->list_warehouse("select * from kho inner join nhanvienkho where kho.maNVKho = nhanvienkho.maNhanVien");
            ?>
        </div>

    <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog">
                <!-- Modal content-->
                    <div class="modal-content" style="width:800px; margin-right:200px;"> 
                        <div class="modal-header">
                        <h4 class="modal-title">Thêm kho</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="loai_kho">Chọn loại kho:</label>
                            <select name="loai_kho" id="loai_kho" class="input form-control">
                                <option value="Kho nguyên vật liệu">Kho nguyên vật liệu</option>
                                <option value="Kho thành phẩm">Kho thành phẩm</option>
                            </select>
                        </div>
                        <label for="nhanvienkho">Chọn nhân viên phụ trách:</label>
                        <select name="nhanvienkho" id="nhanvienkho" class="input form-control">
                            <?php
                            $sql = "SELECT nv.tenNVKho
                            FROM kho k
                            INNER JOIN nhanvienkho nv ON k.maNVKho = nv.maNhanVien
                            GROUP BY tenNVKho";
                            $result = mysqli_query($p->connect(), $sql);
                            // Kiểm tra kết quả và hiển thị trong dropdown
                            if ($result->num_rows > 0) {
                                while($row = $result->fetch_assoc()) {
                                    echo "<option value='". $row['tenNVKho'] ."'>" . $row['tenNVKho'] . "</option>";
                                }
                            } else {
                                echo "<option value=''>Không có dữ liệu</option>";
                            }
                            ?>
                        </select>
                            <div class="form-group">
                                <label for="diachi">Địa chỉ:</label>
                                <input type="text" class="form-control" id="diachi" name="diachi">
                            </div>
                            <div class="form-group">
                                <label for="ten_nvl">Sức chứa (	&#13221;):</label>
                                <input type="number" min="10" class="form-control" id="succhua" name="succhua">
                            </div>
                    </div>


                    <div class="modal-footer">
                        <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button> 
                        <button type="submit" class="btn btn-success" name="button" value="Xác nhận">Xác nhận</button>
                    </div>

                </div>     
            </div>
    </div>

    </form>

    <?php
   if(isset($_POST['button']))
   {
    switch($_POST['button']){
        case 'Xác nhận':
            {
                $tenKho = $_REQUEST['loai_kho'];
                $rowCounted = $p->countRow("SELECT * FROM kho where tenKho like '%$tenKho%'");
                if (strpos($tenKho, 'Kho nguyên vật liệu') !== false) {
                    $maKho = "KNVL" . str_pad($rowCounted + 1, 2, "0", STR_PAD_LEFT);
                    $tenKho = "Kho Nguyên Vật Liệu " . str_pad($rowCounted + 1, 2, "0", STR_PAD_LEFT);
                }
                else
                {
                    $maKho = "KTP" . str_pad($rowCounted + 1, 2, "0", STR_PAD_LEFT);
                    $tenKho = "Kho Thành Phẩm " . str_pad($rowCounted + 1, 2, "0", STR_PAD_LEFT);
                    
                }
                
                $nhanvienkho = $_REQUEST['nhanvienkho'];
                $tenNVKho = $p->pickColumn("select maNhanVien from nhanvienkho where tenNVKho = '$nhanvienkho' limit 1");
                $diachi = $_REQUEST['diachi'];
                $succhua = $_REQUEST['succhua'];

                $query = "INSERT INTO kho (maKho, tenKho, maNVKho, diaChiKho, dungLuongKhoToiDa,tinhTrangKho) VALUES ('$maKho', '$tenKho', '$tenNVKho', '$diachi', '$succhua', 'Hoạt động')";
                if ($p->InsertUpdate($query) == 1) {
                    echo '<script>';
                    echo 'window.onload = function() { $("#successModal").modal("show"); };';
                    echo '</script>';
                } else {
                    echo "Thêm không thành công";
                    echo $maKho;
                    echo $tenNVKho;
                    echo $diachi;
                    echo $succhua;
                    echo $tenKho;
                    echo $query;
                }
            
                break;
            }
            
            
        case "Xóa":
            {
                $id = $_REQUEST['id'];
                $query= "DELETE FROM kho where maKho = '$id'";
                if($p->InsertUpdate($query)==1){
                    echo '<script>';
                    echo 'window.onload = function() { $("#successModal").modal("show"); };';
                    echo '</script>';
                }
                else
                {
                    echo "Xoa khong thanh cong";
                }
                break;
            }
                case "Sửa":
                    {
                        $id = $_REQUEST['id'];
                        $tenKho = $_REQUEST['txtkho'];
                        $rowCounted = $p->countRow("SELECT * FROM kho where tenKho like '%$tenKho%'");
                        if (strpos($tenKho, 'Kho nguyên vật liệu') !== false) {
                            $maKho = "KNVL" . str_pad($rowCounted + 1, 2, "0", STR_PAD_LEFT);
                            $tenKho = "Kho Nguyên Vật Liệu " . str_pad($rowCounted + 1, 2, "0", STR_PAD_LEFT);
                        }
                        else
                        {
                            $maKho = "KTP" . str_pad($rowCounted + 1, 2, "0", STR_PAD_LEFT);
                            $tenKho = "Kho Thành Phẩm " . str_pad($rowCounted + 1, 2, "0", STR_PAD_LEFT);
                            
                        }
                        $nhanvienkho = $_REQUEST['txtnvk'];
                        $diachi = $_REQUEST['txtdiachi'];
                        $succhua = $_REQUEST['txtsucchua'];
                        $tinhtrang = $_REQUEST['txttinhtrang'];
                        $tenNVKho = $p->pickColumn("select maNhanVien from nhanvienkho where tenNVKho = '$nhanvienkho' limit 1");
                        $query = "UPDATE kho SET maKho ='$maKho', tenKho = '$tenKho', maNVKho = '$tenNVKho', diaChiKho = '$diachi', dungLuongKhoToiDa = '$succhua', tinhTrangKho = '$tinhtrang' WHERE maKho = '$id'";
                        if($p->InsertUpdate($query)==1)
                        {
                            echo '<script>';
                            echo 'window.onload = function() { $("#successModal").modal("show"); };';
                            echo '</script>';
                        }
                        else
                        {
                            echo $nhanvienkho;
                            
                        }
                    }
                    
        }
   }
?>



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
        <a href="warehouse.php" class="btn btn-primary">Xác nhận</a>
      </div>
    </div>
  </div>
</div>



