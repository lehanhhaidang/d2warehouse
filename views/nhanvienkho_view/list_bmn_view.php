<h1 algin="center" class="text-center">DANH SÁCH BIỂU MẪU NHẬP</h1>
<div class="bieumau">
<table class="table-sm table-border table-hover table-success">
        <thead>

       
            <tr>
                <th>Stt</th>
                <th>Mã biểu mẫu</th>
                <th>Mã kho</th>
                <th>Ngày nhập</th>
                <th>Loại nhập</th>
                <th>Trạng thái</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
        <?php
        $p->DSBMN("select * from bieumaunhap"); 
        ?>
        
        </tbody>
    </table>
   
</div>


