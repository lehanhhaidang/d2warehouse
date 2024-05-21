<?php 
    include("class/adminback.php");
    $obj= new adminback();

    include("class/classnvk.php");
    $p = new nhanvienkho;

    session_start();
    $admin_id = $_SESSION['admin_id'];
    $admin_email = $_SESSION['admin_email'];
    $admin_role = $_SESSION['role']; // Đây là biến đúng để lưu vai trò của người dùng

    if($admin_id==null){
        header("location:index.php");
    }

    if(isset($_GET['adminLogout'])){
        if($_GET['adminLogout']=="logout"){
            $obj->admin_logout();
        }
    }
?>

<?php 
    include ("includes/head.php")
?>

<!-- <?php
var_dump($admin_role);
?> -->

<body>
    <div class="fixed-button">
    
    </div>
    <!-- Pre-loader start -->
    <div class="theme-loader">
        <div class="loader-track">
            <div class="loader-bar"></div>
        </div>
    </div>
    <!-- Pre-loader end -->
    <div id="pcoded" class="pcoded">
        <div class="pcoded-overlay-box"></div>
        <div class="pcoded-container navbar-wrapper">

         <?php include_once ("includes/headernav.php") ?>


            <div class="pcoded-main-container">
                <div class="pcoded-wrapper">
                   
                <?php 
                    if($admin_role == 'nhanvienkho') {
                        include_once ("includes/sidenav.php");
                    } elseif ($admin_role == 'quanlykho') {
                        include_once ("includes/sidenav_qlk.php");
                    }elseif ($admin_role == 'nvpkehoach') {
                        include_once ("includes/sidenav_pkh.php");
                    }elseif ($admin_role == 'nhanvienkiemke') {
                        include_once ("includes/sidenav_nvkk.php");
                    }elseif ($admin_role == 'giamdoc') {
                        include_once ("includes/sidenav_gd.php");
                    }elseif ($admin_role == 'Admin') {
                        include_once ("includes/sidenav_admin.php");
                    }

                ?>


                    <div class="pcoded-content">
                        <div class="pcoded-inner-content">
                            <div class="main-body">
                                <div class="page-wrapper">

                                    <div class="page-body">
                                     
        
                                <?php 
                                    if($views){
                                        // =================== Dashboard ===================
                                        if($views=="dashboard"){
                                            include ('views/dashborad_view.php');
                                        }elseif($views=="list_tp"){
                                            include ("views/list_tp_view.php");
                                        }elseif($views=="info_tp"){
                                            include ("views/info_tp_view.php");
                                        }elseif($views=="list_nvl"){
                                            include ("views/list_nvl_view.php");
                                        }elseif($views=="info_materials"){
                                            include ("views/info_materials_view.php");
                                        }elseif($views=="kho"){
                                            include ("views/kho_view.php");
                                        }elseif($views=="info_kho"){
                                            include ("views/info_kho_view.php");
                                        // =================== Nhanvienkho ===================
                                        }elseif($views=="list_bmx"){
                                            include ("views/nhanvienkho_view/list_bmx_view.php");
                                        }elseif($views=="info_bmx"){
                                            include ("views/nhanvienkho_view/bmx_view.php");
                                        }elseif($views=="create_pxnvl"){
                                            include ("views/nhanvienkho_view/create_pxnvl_view.php");
                                        }elseif($views=="create_pxtp"){
                                            include ("views/nhanvienkho_view/create_pxtp_view.php");
                                        }elseif($views=="list_bmn"){
                                            include ("views/nhanvienkho_view/list_bmn_view.php");
                                        }elseif($views=="info_bmn"){
                                            include ("views/nhanvienkho_view/bmn_view.php");
                                        }elseif($views=="create_pnnvl"){
                                            include ("views/nhanvienkho_view/create_pnnvl_view.php");
                                        }elseif($views=="create_pntp"){
                                            include ("views/nhanvienkho_view/create_pntp_view.php");
                                        
                                        // =================== Phongkehoach ===================

                                        }elseif($views=="propose_importMaterials"){
                                            include ("views/phongkehoach_view/propose_importMaterials_view.php");
                                        }elseif($views=="propose_manufacture"){
                                            include ("views/phongkehoach_view/propose_manufacture_view.php");
                                        }elseif($views=="create_dxxnvl"){
                                            include ("views/phongkehoach_view/create_dxxnvl_view.php");
                                        }elseif($views=="create_dxnnvl"){
                                            include ("views/phongkehoach_view/create_dxnnvl_view.php");
                                        }elseif($views=="propose_list"){
                                            include ("views/phongkehoach_view/propose_list_view.php");
                                        }elseif($views=="propose_info"){
                                            include ("views/phongkehoach_view/propose_info_view.php");

                                          // =================== Giamdoc ===================

                                        }elseif($views=="propose_list_gd"){
                                            include ("views/giamdoc_view/propose_list_gd_view.php");
                                        }if($views=="dashboard_gd"){
                                            include ('views/giamdoc_view/dashborad_gd_view.php');
                                        }elseif($views=="accept_propose"){
                                            include ("views/giamdoc_view/accept_propose_view.php");

                                        // =================== Quanlykho ===================

                                        }elseif($views=="dpx"){
                                            include ("views/quanlykho_view/dpx_view.php");
                                        }elseif($views=="dp_xuatnvl"){
                                            include ("views/quanlykho_view/dp_xuatnvl_view.php");
                                        }elseif($views=="dpn"){
                                            include ("views/quanlykho_view/dpn_view.php");
                                        }elseif($views=="dp_nhapnvl"){
                                            include ("views/quanlykho_view/dp_nhapnvl_view.php");
                                        }
                                        // =================== Admin ===================
                                        elseif($views=="account"){
                                            include ("views/admin_view/account_view.php");
                                        }elseif($views=="warehouse"){
                                            include ("views/admin_view/warehouse_view.php");
                                        }elseif($views=="materials"){
                                            include ("views/admin_view/materials_view.php");
                                        }elseif($views=="products"){
                                            include ("views/admin_view/products_view.php");
                                        }elseif($views=="chatbot_manage"){
                                            include ("views/admin_view/chatbot_manage_view.php");
                                        }
                                        // ====================Chat app====================
                                        elseif($views=="chatapp"){
                                            include ("views/chatapp_view.php");
                                        }
                                    }
                                ?>
                                <?php include_once ("includes/footer.php") ?>
                                    <div id="styleSelector">

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Warning Section Starts -->
        <!-- Older IE warning message -->
    <!--[if lt IE 9]>
<div class="ie-warning">
    <h1>Warning!!</h1>
    <p>You are using an outdated version of Internet Explorer, please upgrade <br/>to any of the following web browsers to access this website.</p>
    <div class="iew-container">
        <ul class="iew-download">
            <li>
                <a href="http://www.google.com/chrome/">
                    <img src="assets/images/browser/chrome.png" alt="Chrome">
                    <div>Chrome</div>
                </a>
            </li>
            <li>
                <a href="https://www.mozilla.org/en-US/firefox/new/">
                    <img src="assets/images/browser/firefox.png" alt="Firefox">
                    <div>Firefox</div>
                </a>
            </li>
            <li>
                <a href="http://www.opera.com">
                    <img src="assets/images/browser/opera.png" alt="Opera">
                    <div>Opera</div>
                </a>
            </li>
            <li>
                <a href="https://www.apple.com/safari/">
                    <img src="assets/images/browser/safari.png" alt="Safari">
                    <div>Safari</div>
                </a>
            </li>
            <li>
                <a href="http://windows.microsoft.com/en-us/internet-explorer/download-ie">
                    <img src="assets/images/browser/ie.png" alt="">
                    <div>IE (9 & above)</div>
                </a>
            </li>
        </ul>
    </div>
    <p>Sorry for the inconvenience!</p>
</div>
<![endif]-->
<!-- Warning Section Ends -->
<!-- Required Jquery -->

<?php 
    include ("includes/script.php")
?>
