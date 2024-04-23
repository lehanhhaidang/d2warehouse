<h1 algin="center">DANH SÁCH ĐỀ XUẤT</h1>
<div class="propose-list-gd">
<table class="table table-bordered table-hover">
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
        $p->list_propose_gd("select * from dexuat group by madexuat"); 
        ?>
        
        </tbody>
    </table>
   
</div>