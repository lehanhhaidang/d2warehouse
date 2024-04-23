<h1 algin="center">DANH SÁCH ĐƠN HÀNG</h1>
<div class="donhang">
<table class="table table-bordered table-hover">
        <thead>

       
            <tr>
                <th>Stt</th>
                <th>Mã biểu mẫu</th>
                <th>Tên khách hàng</th>
                <th>Ngày đặt hàng</th>
                <th>Ngày giao dự kiến</th>
                <th>Trạng thái</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
        <?php
        $p->DSDH("select * from donhang"); 
        ?>
        
        </tbody>
    </table>
   
</div>


