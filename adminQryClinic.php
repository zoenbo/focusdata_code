<?php
include_once 'classes/Language/language.common.php';
?>
<!DOCTYPE html>
<html lang="en">
<head>
<title><?php echo $lang['Lang0003']; ?></title>
<meta charset="utf-8">    
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" href="img/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />
<meta name="description" content="Your description">
<meta name="keywords" content="Your keywords">
<meta name="author" content="Your name">
<!--CSS-->
<link rel="stylesheet" href="css/bootstrap.css" ><!-- dialog --><link href="css/bootstrap-dialog.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="fonts/font-awesome.css">
<!--user css-->
<link rel="stylesheet" href="css/user.css">
<link rel="stylesheet" href="css/focusdata.css">
<!--datetables css-->
<link rel="stylesheet" href="js/datatables/dataTables.bootstrap.min.css">
<!-- datetime -->
<link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">


<!--JS-->
<script src="js/jquery.js"></script>
<script src="js/jquery-migrate-1.2.1.min.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/jquery.mobilemenu.js"></script>
<script src="js/jquery.equalheights.js"></script> 
<script src="js/jquery.ui.totop.js"></script>
<script src="js/jquery.cookie.js"></script>



<!--[if (gt IE 9)|!(IE)]><!-->
<script src="js/wow/wow.js"></script>
<script src="js/wow/device.min.js"></script>
<script>
    $(document).ready(function () {       
      if ($('html').hasClass('desktop')) {
        new WOW().init();
      }   
    });
</script>
<!--<![endif]-->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>

    <div id="ie6-alert" style="width: 100%; text-align:center;">
    <img src="http://beatie6.frontcube.com/images/ie6.jpg" alt="Upgrade IE 6" width="640" height="344" border="0" usemap="#Map" longdesc="http://die6.frontcube.com" />
      <map name="Map" id="Map"><area shape="rect" coords="496,201,604,329" href="http://www.microsoft.com/windows/internet-explorer/default.aspx" target="_blank" alt="Download Interent Explorer" /><area shape="rect" coords="380,201,488,329" href="http://www.apple.com/safari/download/" target="_blank" alt="Download Apple Safari" /><area shape="rect" coords="268,202,376,330" href="http://www.opera.com/download/" target="_blank" alt="Download Opera" /><area shape="rect" coords="155,202,263,330" href="http://www.mozilla.com/" target="_blank" alt="Download Firefox" />
        <area shape="rect" coords="35,201,143,329" href="http://www.google.com/chrome" target="_blank" alt="Download Google Chrome" />
      </map>
  </div>
  <![endif]-->
</head>
<body>
<!--header-->
<div class="container bars"><em class="bars_"></em></div>
<header>
    <nav class="navbar navbar-default navbar-static-top tm_navbar clearfix" role="navigation">
        <div class="container">
            <ul class="nav sf-menu clearfix">
                <li id="li_home" class="hidden"><a href="index.php"><!-- Home --><?php echo $lang['Lang0005']; ?></a></li>
                <li class="sub-menu"><a href="#"><?php echo $lang['Lang0010']; ?></a><span></span>
                    <ul class="submenu">
                        <li><a href="?lang=en">English</a></li>
                        <li><a href="?lang=ch">中文</a></li>     
                    </ul>
                </li>

                <li><a href="index-2.php"><!-- about us --><?php echo $lang['Lang0011']; ?></a></li>
                <li><a href="index-3.php"><!-- staff --><?php echo $lang['Lang0012']; ?></a></li>
                <li><a href="index-4.php"><!-- Contacts --><?php echo $lang['Lang0013']; ?></a></li>
                <li><a href="sign_in.php"><!-- Sign in --><?php echo $lang['Lang0014']; ?></a></li>
                <li><a href="sign_up_person.php"><!-- register --><?php echo $lang['Lang0015']; ?></a></li>
                <li class="sub-menu tourist"><a href="#" id="userinfo"><!-- 游客 --><?php echo $lang['Lang0016']; ?></a><span></span>
                    <ul class="submenu hidden" id="sub_userinfo">
                        <li><a href="#" id="usertype"></a></li>
                        <li><a href="#">账户管理</a></li>
                        <li id="li_SearchDoctor" class="hidden"><a href="searchDoctor.php"><!-- 搜索|预约医生 --><?php echo $lang['Lang0006']; ?></a></li>
                        <li id="li_AppRecoder" class="hidden"><a href="userAppointmentRecoder.php"><!-- 个人用户管理 --><?php echo $lang['Lang0007']; ?></a>
                        </li>
                        <li id="li_ClinicUser" class="hidden"><a href="clinicUpdUserInfo.php"><!-- 诊所用户管理 --><?php echo $lang['Lang0008']; ?></a>
                        </li>
                        <li id="li_Admin" class="hidden"><a href="adminQryClinic.php"><!-- 管理员管理 --><?php echo $lang['Lang0009']; ?></a></li>
                        <li><button class="btn btn-danger" id="btn_out"><!-- 安全退出 --><?php echo $lang['Lang0017']; ?></button></li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
    <h1 class="navbar-brand navbar-brand_"><a href="#"><img src="img/<?php echo $lang['Lang0004']; ?>" alt="logo"></a></h1>
</header>
<!--content--> 
<div class="content">
  <div class="stellar-section">
    <div class="thumb-box9" data-stellar-background-ratio="0.1">
      <div class="container">
        <div class="row left_con">
          <div class="col-lg-3 col-md-3 col-sm-3 wow fadeInUp" data-wow-delay="0.1s">
            <div class="list-group">
              <a href="adminQryClinic.php" class="list-group-item active" id="user_appointment_recoder" ><!-- 诊所用户管理 --><?php echo $lang['Lang0034']; ?></a>
              <a href="adminQryUser.php" class="list-group-item" id="user_upd_person_pwd"><!-- 个人用户管理 --><?php echo $lang['Lang0035']; ?></a>
              <a href="adminQryDoctor.php" class="list-group-item" id="user_upd_person_info"><!-- 医生信息管理 --><?php echo $lang['Lang0036']; ?></a>
              <a href="adminUpdPwd.php" class="list-group-item" id="user_upd_person_pwd"><!-- 修改管理员密码 --><?php echo $lang['Lang0037']; ?></a>
              <a href="adminService.php" class="list-group-item"><!-- 服务列表 --><?php echo $lang['Lang0038']; ?></a>
            </div>
          </div>

          <div class="col-lg-9 col-md-9 col-sm-9 wow fadeInUp" data-wow-delay="0.1s">
              <div class="PersonUser">
                <div class="savedoctor">

                  <h2><!-- 诊所用户管理 --><?php echo $lang['Lang0034']; ?></h2>
                  <div class="row">
                      <form class="form-inline" role="form" id="adminQryClinic_form">
                          <input type="hidden" class="form-control" name="action_type" id="action_type" value="view_name_addr">
                          <div class="form-group">
                            <label for="CLINIC_NAME" class="control-label"><!-- 诊所名称 --><?php echo $lang['Lang0039']; ?></label>
                            <input type="text" class="form-control" name="CLINIC_NAME" id="CLINIC_NAME">
                          </div>

                          <div class="form-group">
                            <label for="CLINIC_SUBURB" class="control-label"><!-- 区 --><?php echo $lang['Lang0040']; ?></label>
                            <input type="text" class="form-control" name="CLINIC_SUBURB" id="CLINIC_SUBURB">
                          </div>

                          <div class="form-group">
                            <label for="STATE_ID" class="control-label"><!-- 州 --><?php echo $lang['Lang0041']; ?></label>
                            <select class="form-control" name="STATE_ID" id="STATE_ID">
                              <option value=""><!-- 全部 --><?php echo $lang['Lang0042']; ?></option>
                            </select>
                          </div>

                          <div class="form-group">
                            <label for="ACTIVE_STATUS" class="control-label"><!-- 状态 --><?php echo $lang['Lang0043']; ?></label>
                            <select class="form-control" name="ACTIVE_STATUS" id="ACTIVE_STATUS">
                              <option value=""><!-- 全部 --><?php echo $lang['Lang0042']; ?></option>
                              <option value="1"><!-- active --><?php echo $lang['Lang0045']; ?></option>
                              <option value="0"><!-- inactive --><?php echo $lang['Lang0046']; ?></option>
                            </select>
                          </div>

                           <button class="btn btn-primary search_ok" id="search_ok"><span class="glyphicon glyphicon-search" aria-hidden="true"></span> <!-- Search --><?php echo $lang['Lang0044']; ?></button>  

                           <button class="btn btn-warning" id="btn_active"><!-- active --><?php echo $lang['Lang0045']; ?></button>
                           <button class="btn btn-danger" id="btn_inactive"><!-- inactive --><?php echo $lang['Lang0046']; ?></button>
                       </form>
                  </div>



                  <div class="row">
                   <!-- <table id="dataTables-example" class="table table-striped table-bordered" cellspacing="0" width="100%"> -->
                    <table id="dataTables-example" class="table table-hover  table-bordered" >
                      <thead class="table_title">
                          <tr>
                            <th><input type="checkbox" name="chk_all" id="chk_all"></th>
                            <th><!-- 用户名 --><?php echo $lang['Lang0047']; ?></th>
                            <th><!-- 邮箱 --><?php echo $lang['Lang0048']; ?></th>
                            <th><!-- 诊所名称 --><?php echo $lang['Lang0049']; ?></th>
                            <th><!-- 详细地址 --><?php echo $lang['Lang0050']; ?></th>
                            <th><!-- 区 --><?php echo $lang['Lang0051']; ?></th>
                            <th><!-- 州 --><?php echo $lang['Lang0052']; ?></th>
                            <th><!-- 邮编 --><?php echo $lang['Lang0053']; ?></th>
                            <th><!-- 状态 --><?php echo $lang['Lang0054']; ?></th>
                            <th><!-- 操作 --><?php echo $lang['Lang0055']; ?></th>
                          </tr>
                      </thead>
                    </table>
                  </div>

              </div>
              <!-- savedoctor -->
            </div>
            <!-- PersonUser -->
          </div>
          <!-- wow -->
        </div>
        <!-- row -->
      </div>
      <!-- container -->
    </div>
  </div>
</div>

<!--footer-->
<footer>
    <div class="container">
        <div class="row">
            <div class="col-lg-12 center">
                <ul class="follow_icon">
                    <li><a href="#" class="fa fa-twitter"></a></li>
                    <li><a href="#" class="fa fa-facebook"></a></li>
                    <li><a href="#" class="fa fa-google-plus"></a></li>
                    <li><a href="#" class="fa fa-rss"></a></li>
                    <li><a href="#" class="fa fa-pinterest"></a></li>
                    <li><a href="#" class="fa fa-linkedin"></a></li>
                </ul>
            </div>
            <div class="col-lg-12 center">
                <p>84, Charing Cross Road,London<br>JL 851213-2340</p>
            </div>
            <div class="col-lg-12 center">
                <p class="privacy">&copy; <em id="copyright-year"></em> <i>|</i> <a href="index-5.php">Privacy Policy</a></p>
            </div>
        </div>
    </div>
</footer>


<!-- 为了实现js多语言 begin -->

<!-- 总开关，为了设置第三方库的多语言而设置 -->
<div id="which_lang" style="display: none;"><?php echo $_SESSION ['lang']; ?></div>

<!-- 密码重置成功! -->
<div id="Lang0032" style="display: none;"><?php echo $lang['Lang0032']; ?></div>

<!-- 请选择需要修改的数据 -->
<div id="Lang0033" style="display: none;"><?php echo $lang['Lang0033']; ?></div>

<!-- 确定修改 -->
<div id="Lang0018" style="display: none;"><?php echo $lang['Lang0018']; ?></div>

<!-- 您未登陆,无法使用此功能 -->
<div id="Lang0019" style="display: none;"><?php echo $lang['Lang0019']; ?></div>

<!-- 请修改个人信息，添加邮箱地址 -->
<div id="Lang0020" style="display: none;"><?php echo $lang['Lang0020']; ?></div>

<!-- 详细 -->
<div id="Lang0056" style="display: none;"><?php echo $lang['Lang0056']; ?></div>

<!-- 修改-->
<div id="Lang0057" style="display: none;"><?php echo $lang['Lang0057']; ?></div>

<!-- 密码重置 -->
<div id="Lang0058" style="display: none;"><?php echo $lang['Lang0058']; ?></div>


<!-- 为了实现js多语言 end -->




<!-- DataTables JavaScript -->
<script src="bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
<script src="bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>

<!-- datetime -->
<script type="text/javascript" src="js/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<script src="js/bootstrap.min.js"></script><!-- dialog --><script src="js/bootstrap-dialog.min.js"></script>


<script src="js/tm-scripts.js"></script>
<script src="js/main/pub.js"></script>
<script src="js/main/adminQryClinic.js"></script>
</body>
</html>