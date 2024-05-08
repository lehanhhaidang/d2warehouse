<?php 
if(isset($_REQUEST['id']))
{
    $id = $_REQUEST['id'];
}
?>

<form action="" method="post">
<div class="button">
    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">Thêm thành phẩm</button>
</div>
<br>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th class="text-center">Tên</th>
                    <th class="text-center">Đơn vị tính</th>
                    <th class="text-center">Tùy chọn</th>
                </tr>
            </thead>
            <tbody>
                    <input type="hidden" name="idchon" id="idchon" value="<?php echo $id ?>"></td>
                    <td><input name="txtten" type="text" id="txtten" class="input form-control" value="<?php echo $p->pickColumn("select tenThanhPham from thanhpham where maThanhPham = '$id' limit 1 ");?>"></td>
                    <td><input name="txtdvt" type="text" id="txtdvt" class="input form-control" value="<?php echo $p->pickColumn("select donViTinh from thanhpham where maThanhPham= '$id' limit 1 ");?>"></td>
                    <td>
                        <button type="submit" class="btn btn-success" name="button" value="Sửa">Sửa</button>
                        <button type="submit" class="btn btn-danger" name="button" value="Xóa">Xóa</button>                    
                    </td>
            </tbody>
        </table>
    <div class="text-center">
    <?php
    $p->list_products("select * from thanhpham"); 
    ?>
    </div>

<div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">
            <!-- Modal content-->
                <div class="modal-content" style="width:800px; margin-right:200px;"> 
                    <div class="modal-header">
                    <h4 class="modal-title">Thêm thành phẩm</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="ten_tp">Tên thành phẩm:</label>
                        <input type="text" class="form-control" id="ten_tp" name="ten_tp">
                    </div>
                    <div class="form-group">
                        <label for="dvt">Đơn vị tính:</label>
                        <input type="text" class="form-control" id="dvt" name="dvt">
                    </div>
                    <div class="form-group">
                        <label for="hinh_dai_dien">Tải lên hình đại diện:</label>
                        <input type="file" class="form-control-file" id="hinh_dai_dien" name="hinh_dai_dien">
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
                $ten_tp = $_REQUEST['ten_tp'];
                $dvt = $_REQUEST['dvt'];
                $rowCounted = $p->countRow("SELECT * FROM thanhpham");
                $maNVL = "TP" . str_pad($rowCounted + 1, 2, "0", STR_PAD_LEFT);
                
                $hinhdaidien_name = $_FILES['hinhdaidien']['name'];
                $query = "INSERT INTO thanhpham (maThanhPham,tenThanhPham,donViTinh,anh) VALUES ('$maNVL','$ten_nvl','$dvt','$hinhdaidien_name')";
        
                if (mysqli_query($p->connect(), $query)) {
                    echo '<script>';
                    echo 'window.onload = function() { $("#successModal").modal("show"); };';
                    echo '</script>';
                    echo $hinhdaidien_path;
                }
                break;
            }
        case "Xóa":
            {
                $query= $p->InsertUpdate("DELETE FROM thanhpham WHERE maThanhPham = '$id'");
                if($query==1)
                {
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
                        $ten = $_REQUEST['txtten'];
                        $dvt = $_REQUEST['txtdvt'];
                        $query = $p->InsertUpdate("UPDATE thanhpham SET tenThanhPham = '$ten', donViTinh = '$dvt' WHERE maThanhPham = '$id'");
                        if($query==1)
                        {
                            echo '<script>';
                            echo 'window.onload = function() { $("#successModal").modal("show"); };';
                            echo '</script>';
                        }
                        else
                        {
                            echo "Sua khong thanh cong";
                        }
                        
                        break;
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
        <a href="products.php" class="btn btn-primary">Xác nhận</a>
      </div>
    </div>
  </div>
</div>