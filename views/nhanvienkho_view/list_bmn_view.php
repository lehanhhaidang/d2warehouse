<h1 algin="center" class="text-center">DANH SÁCH BIỂU MẪU NHẬP</h1>
<div class="bieumau">
<table class="table table-border table-hover">
        <thead>

       
            <tr>
                <th>Stt</th>
                <th>Mã biểu mẫu</th>
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


