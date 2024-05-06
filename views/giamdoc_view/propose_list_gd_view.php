<h1 algin="center" class="text-center">DANH SÁCH ĐỀ XUẤT</h1>
<div class="propose-list-gd">
<table class="table-sm table-border table-hover mx-auto">
        <thead>
            <tr>
                <th>STT</th>
                <th>Mã đề xuất</th>
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