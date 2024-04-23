<h1 algin="center"class="text-center">DANH SÁCH BIỂU MẪU NHẬP</h1>
<div class="propose-list">
<table class="table-sm table-bordered table-hover table-success">
        <thead>
            <tr>
                <th>STT</th>
                <th>Mã đề xuât</th>
                <th>Tên đề xuất</th>
                <th>Trạng thái</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
        <?php
        $p->list_propose("select * from dexuat group by madexuat"); 
        ?>
        
        </tbody>
    </table>
   
</div>
