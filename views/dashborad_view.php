<?php 
    date_default_timezone_set("Asia/Ho_Chi_Minh");
    $total_pnnvl = $p->countPNNVL();
    $total_pxnvl = $p-> countPXNVL();
    $total_pntp = $p->countPNTP();
    $total_pxtp = $p->countPXTP();
    $total_uncomplete_form = $p->count_total_uncomplete_form();
    $total_completed_form = $p->count_total_completed_form();
    $total_materials = $p->count_materials();
    $total_products = $p->count_products();

?>
<style>
    .mydiv{
        width: 200px;
        position: absolute;
        right: 38px;
        overflow: hidden;
    }
</style>
<h2>Dashboard </h2>


<!-- <div class="mydiv">
<form action="" class="form">
    <select name="filterDate" id="filterDate" class="form-control">
        <option value="<?php echo date("Y/m/d")?>" >Today</option>
        <option value="<?php echo date('Y-m-d', strtotime('-7 days')) ?>" >This week</option>
        <option value="<?php echo date('Y-m-d', strtotime('-30 days')) ?>" >This Month</option>
        <option value="<?php echo date('Y-m-d', strtotime('-365 days')) ?>" >This Year</option>
        <option value="2020-01-01" >Life Time</option>
    </select>
</form>
</div> -->


<script>
    $(document).ready(function(){
      

        $("#filterDate").change(function(){
            var filterId = this.value;

            $.ajax({
                 url: "json/dashboard_json.php",
                 method: "POST",
                 data: {
                     action: 'load_allorder',
                     did: filterId
                 },
                 success: function(data) {
                     var html = data;
                    
                     $('#totalOrder').text(data);
                 }
             });

             $.ajax({
                 url: "json/dashboard_json.php",
                 method: "POST",
                 data: {
                     action: 'load_allsell',
                     did: filterId
                 },
                 success: function(data) {
                     var html = data;
                    
                     $('#totalSell').text(data);
                 }
             });

             $.ajax({
                 url: "json/dashboard_json.php",
                 method: "POST",
                 data: {
                     action: 'load_allcustomer',
                     did: filterId
                 },
                 success: function(data) {
                     var html = data;
                    
                     $('#totalCustomer').text(data);
                 }
             });

             $.ajax({
                 url: "json/dashboard_json.php",
                 method: "POST",
                 data: {
                     action: 'load_delivered_order',
                     did: filterId
                 },
                 success: function(data) {
                     var html = data;
                    
                     $('#DeliverOrder').text(data);
                 }
             });
             $.ajax({
                 url: "json/dashboard_json.php",
                 method: "POST",
                 data: {
                     action: 'load_processing_order',
                     did: filterId
                 },
                 success: function(data) {
                     var html = data;
                    
                     $('#processingOrder').text(data);
                 }
             });

             $.ajax({
                 url: "json/dashboard_json.php",
                 method: "POST",
                 data: {
                     action: 'load_pending_order',
                     did: filterId
                 },
                 success: function(data) {
                     var html = data;
                    
                     $('#pendingOrder').text(data);
                 }
             });



        })
    })
</script>


<br> <br> <br>
<div class="row">



<!-- order-card start -->

<div class="col-md-6 col-xl-3">
    <div class="card bg-c-blue order-card">
        <div class="card-block">
            <h6 class="m-b-20">Số phiếu nhập nguyên vật liệu</h6>
            <h2 class="text-right"><i class="ti-package f-left"></i><span id="totalOrder"><?php  echo  $total_pnnvl; ?></span></h2>
            <p class="m-b-0"><span class="f-right"></span></p>
        </div>
    </div>
</div>
<div class="col-md-6 col-xl-3">
    <div class="card bg-c-blue order-card">
        <div class="card-block">
            <h6 class="m-b-20">Số phiếu xuất nguyên vật liệu:</h6>
            <h2 class="text-right"><i class="ti-package f-left"></i><span id="totalOrder"><?php  echo  $total_pxnvl; ?></span></h2>
            <p class="m-b-0"><span class="f-right"></span></p>
        </div>
    </div>
</div>
<div class="col-md-6 col-xl-3">
    <div class="card bg-c-blue order-card">
        <div class="card-block">
            <h6 class="m-b-20">Số phiếu nhập thành phẩm:</h6>
            <h2 class="text-right"><i class="ti-package f-left"></i><span id="totalOrder"><?php  echo  $total_pntp; ?></span></h2>
            <p class="m-b-0"><span class="f-right"></span></p>
        </div>
    </div>
</div>

<div class="col-md-6 col-xl-3">
    <div class="card bg-c-blue order-card">
        <div class="card-block">
            <h6 class="m-b-20">Số phiếu xuất thành phẩm:</h6>
            <h2 class="text-right"><i class="ti-package f-left"></i><span id="totalOrder"><?php  echo  $total_pxtp; ?></span></h2>
            <p class="m-b-0"><span class="f-right"></span></p>
        </div>
    </div>
</div>

<div class="col-md-6 col-xl-3">
    <div class="card bg-c-pink order-card">
        <div class="card-block">
            <h6 class="m-b-20">Số lượng nguyên vật liệu</h6>
            <h2 class="text-right"><i class="ti-shopping-cart f-left"></i><span id="DeliverOrder"><?php echo  $total_materials ; ?></span></h2>
            <p class="m-b-0"><span class="f-right"></span></p>
        </div>
    </div>
</div>

<div class="col-md-6 col-xl-3">
    <div class="card bg-c-pink order-card">
        <div class="card-block">
            <h6 class="m-b-20">Số lượng thành phẩm </h6>
            <h2 class="text-right"><i class="ti-shopping-cart-full f-left"></i><span id="processingOrder"><?php echo   $total_products; ?></span></h2>
            <p class="m-b-0"><span class="f-right"></span></p>
        </div>
    </div>
</div>

<div class="col-md-6 col-xl-3">
    <div class="card bg-c-green order-card">
        <div class="card-block">
            <h6 class="m-b-20">Biểu mẫu đã lập phiếu:</h6>
            <h2 class="text-right"><i class="ti-check f-left"></i><span id="totalSell"><?php echo $total_completed_form?></span></h2>
            <p class="m-b-0"><span class="f-right"></span></p>
        </div>
    </div>
</div>
<div class="col-md-6 col-xl-3">
    <div class="card bg-c-yellow order-card">
        <div class="card-block">
            <h6 class="m-b-20">Biểu mẫu chưa lập phiếu</h6>
            <h2 class="text-right"><i class="ti-time f-left"></i><span id="totalCustomer"><?php  echo  $total_uncomplete_form; ?></span></h2>
            <p class="m-b-0"><span class="f-right"></span></p>
        </div>
    </div>
</div>


<!-- <div class="col-md-6 col-xl-3">
    <div class="card bg-c-yellow order-card">
        <div class="card-block">
            <h6 class="m-b-20">Vùng sản xuất</h6>
            <h2 class="text-right"><i class="ti-map-alt f-left"></i><span id="pendingOrder"><?php echo  $demvsx ; ?></span></h2>
            <p class="m-b-0"><span class="f-right"></span></p>
        </div>
    </div>
</div> -->


<!-- order-card end -->


<!-- users visite and profile start -->

<!-- users visite and profile end -->

</div>
</div>

