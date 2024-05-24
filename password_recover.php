<?php 
    include("class/adminback.php");
    $obj= new adminback();

    include("class/classnvk.php");
    $p = new nhanvienkho;
    
    if(isset($_POST['admin_btn'])){
        $log_msg = $obj->admin_login($_POST);
    }
    session_start();
    if(isset($_SESSION['admin_id']) && $_SESSION['role']== "giamdoc"){
        header("location:dashboard_gd.php");
    }elseif(isset($_SESSION['admin_id']) && $_SESSION['role']== "nhanvienkho"){
        header("location:dashboard.php");
    }
?>

<?php 
    include ("includes/head.php")
?>
  <body>
<div id="dangnhap">

  <section class="login p-fixed d-flex text-center common-img-bg bg-primary  ">

        <!-- Container-fluid starts -->
        <div class="container">
           
            <div class="row">
                <div class="col-sm-12">
                    <!-- Authentication card start -->
                    <div class="login-card card-block auth-body mr-auto ml-auto">
                        <form action="" method="post" class="md-float-material">
                            <div class="text-center">
                              
                            </div>
                            <div class="auth-box">
                                <div class="row m-b-20">
                                    <div class="col-md-12">
                                        <h3 class="text-center text-primary">Quên mật khẩu</h3>
                                        <h6 class="text-danger text-left">
                                            <?php 
                                                if(isset($log_msg)){
                                                    echo $log_msg;
                                                }
                                            ?>
                                        </h6>
                                    </div>
                                </div>
                                <hr/>
                                <div class="label">
                                    <label for="email" class="text-left" style="color:black; display:block; font-size:large">
                                                Nhập email tài khoản của bạn
                                    </label>
                                </div>
                                <div class="input-group">
                                     <input type="email" class="form-control input-lg" placeholder="example@gmail.com" name="admin_email">
                                    <span class="md-line"></span>
                                </div>
                                <div class="row m-t-30">
                                    <div class="col-md-12">
                                        <input type="submit" name="admin_btn" class="btn btn-primary btn-md btn-block waves-effect text-center m-b-20 mx-auto" value="Đăng nhập">
                                    </div>
                                </div>
                                <hr/>


                            </div>
                        </form>
                        <!-- end of form -->
                    </div>
                    <!-- Authentication card end -->
                </div>
                <!-- end of col-sm-12 -->
            </div>
            <!-- end of row -->
        </div>
        <!-- end of container-fluid -->
    </section>
</div>

  

<?php 
    include ("includes/script.php")
?>

