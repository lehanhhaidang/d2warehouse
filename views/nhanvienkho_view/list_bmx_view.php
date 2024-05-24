<h1 algin="center" class="text-center">DANH SÁCH BIỂU MẪU XUẤT</h1>
<div class="bieumau">
<table class="table table-bordered table-hover">
        <thead>
            <tr>
                <th>Stt</th>
                <th>Mã biểu mẫu</th>
                <th>Ngày xuất</th>
                <th>Loại xuất</th>
                <th>Trạng thái</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
        <?php
        $p->DSBMX("select * from bieumauxuat"); 
        ?>
        
        </tbody>
    </table>
   
</div>


