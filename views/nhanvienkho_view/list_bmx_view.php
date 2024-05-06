<h1 algin="center" class="text-center">DANH SÁCH BIỂU MẪU XUẤT</h1>
<div class="bieumau">
<table class="table-sm table-border table-hover">
        <thead>
            <tr>
                <th>Stt</th>
                <th>Mã biểu mẫu</th>
                <th>Mã kho</th>
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


