<?php
include_once 'classes/Language/language.common.php';
?>
<!DOCTYPE html>
<html lang="en">
<head>
<title>修改医生信息</title>
<meta charset="utf-8">    
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" href="img/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />
<meta name="description" content="Your description">
<meta name="keywords" content="Your keywords">
<meta name="author" content="Your name">
<meta name = "format-detection" content = "telephone=no" />
<!--CSS-->
<link rel="stylesheet" href="css/bootstrap.css" ><!-- dialog --><link href="css/bootstrap-dialog.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="fonts/font-awesome.css">
<!--User CSS-->
<link rel="stylesheet" href="css/user.css">
<link rel="stylesheet" href="css/focusdata.css">
<!--JS-->
<script src="js/jquery.js"></script>
<script src="js/jquery-migrate-1.2.1.min.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/jquery.mobilemenu.js"></script>
<script src="js/jquery.equalheights.js"></script> 
<script src="js/jquery.ui.totop.js"></script>

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
                <li><a href="index.php">home</a></li>
                <li class="sub-menu active"><a href="index-1.php">our services</a><span></span>
                    <ul class="submenu">
                        <li><a href="searchDoctor.php">搜索|预约医生</a></li>
                        <li id="li_AppRecoder" class="hidden"><a href="userAppointmentRecoder.php">个人用户管理</a>
                        </li>
                        <li id="li_ClinicUser" class="hidden"><a href="clinicUpdUserInfo.php">诊所用户管理</a>
                        </li>
                        <li id="li_Admin" class="hidden"><a href="adminQryClinic.php">管理员管理</a></li>
                    </ul>
                </li>
                <li><a href="index-2.php">about us</a></li>
                <li><a href="index-3.php">staff</a></li>
                <li><a href="index-4.php">Contacts</a></li>
                <li><a href="sign_in.php">Sign in</a></li>
                <li><a href="sign_up_person.php">Sign up</a></li>
                <li class="sub-menu tourist"><a href="#" id="userinfo">游客</a><span></span>
                    <ul class="submenu hidden" id="sub_userinfo">
                        <li><a href="#" id="usertype"></a></li>
                        <li><a href="#">账户管理</a></li>
                        <li><button class="btn btn-danger" id="btn_out">安全退出</button></li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
    <h1 class="navbar-brand navbar-brand_"><a href="index.php"><img src="img/<?php echo $lang['Lang0004']; ?>" alt="logo"></a></h1>
</header>

<!--content-->
<div class="content">
	<div class="stellar-section">
		<div class="thumb-box9" data-stellar-background-ratio="0.1">
			<div class="adminUpdDoc">
				<div class="container">
					<div class="row">
							<h2 class="wow fadeInRight">修改医生信息</h2>
							
							
							<div class="col-md-10 col-lg-10 col-md-offset-1 col-lg-offset-1">
								<form class="form-horizontal wow fadeInLeft" role="form" id="adminUpdDoctorDetail">
									<fieldset>
										<input type="hidden" class="form-control" name="action_type" id="action_type" value="update_doctor_info">
										<input type="hidden" class="form-control" name="DOCTOR_ID" id="DOCTOR_ID">

										<div class="form-group" id="clinic_info">
										    <div class="col-sm-10 col-sm-offset-2">
										    	<label class="control-label " id="CLINIC_NAME"></label>
										      	
										      	<!-- <label class="control-label" id="STATE_NAME"></label> -->
										    </div>
										    <div class="col-sm-10 col-sm-offset-2">
										    	<label class="control-label" id="CLINIC_ADDR"></label>
										    </div>
										</div>

										<!-- <div class="form-group">
										    <label for="CLINIC_NAME" class="col-sm-2 control-label">诊所名称</label>
										    <div class="col-sm-10">
										      <input type="text" class="form-control" name="CLINIC_NAME" id="CLINIC_NAME" disabled>
										    </div>
										</div>

										<div class="form-group">
										    <label for="CLINIC_ADDR" class="col-sm-2 control-label">诊所地址</label>
										    <div class="col-sm-10">
										      <input type="text" class="form-control" name="CLINIC_ADDR" id="CLINIC_ADDR" disabled="true">
										    </div>
										</div>

										<div class="form-group">
										    <label for="STATE_ID" class="col-sm-2 control-label">州</label>
										    <div class="col-sm-10">
										      <select class="form-control" id="STATE_ID" name="STATE_ID" disabled="true">
                        						</select>
										    </div>
										</div> -->

									 	<div class="form-group">
										    <label for="DOCTOR_TYPE" class="col-sm-2 control-label">医生类别<span class="span-red">*</span></label>
										    <div class="col-sm-10">
										      <input type="text" class="form-control" name="DOCTOR_TYPE" id="DOCTOR_TYPE">
										    </div>
										</div>
										<div class="form-group">
										    <label for="DOCTOR_NAME" class="col-sm-2 control-label">医生姓名<span class="span-red">*</span></label>
										    <div class="col-sm-10">
										      <input type="text" class="form-control" name="DOCTOR_NAME" id="DOCTOR_NAME">
										    </div>
										</div>	
										<div class="form-group">
										    <label for="DOCTOR_GENDER" class="col-sm-2 control-label">性别<span class="span-red">*</span></label>
										    <div class="col-sm-10">
										      	<select class="form-control" name="DOCTOR_GENDER" id="DOCTOR_GENDER">
													<option>男</option>
													<option>女</option>
												</select>
										    </div>
										</div>
										<div class="form-group">
										    <label for="ACTIVE_STATUS" class="col-sm-2 control-label">状态<span class="span-red">*</span></label>
										    <div class="col-sm-10">
										      	<select class="form-control" name="ACTIVE_STATUS" id="ACTIVE_STATUS">
													<option value="1">active</option>
													<option value="0">inactive</option>
												</select>
										    </div>
										</div>
										<div class="form-group">
										    <label for="DOCTOR_INFO" class="col-sm-2 control-label">医生详细信息<span class="span-red">*</span></label>
										    <div class="col-sm-10">
										    	<textarea class="form-control" rows="5" name="DOCTOR_INFO" id="DOCTOR_INFO"  placeholder="医生详细信息"></textarea>
										    </div>	
										</div>

										<input type="hidden" class="form-control" name="DOCTOR_PHOTO" id="DOCTOR_PHOTO">
									</fieldset>
								</form>

								<div class="row doctor_photo">
									 <label for="DOCTOR_PHOTO" class="col-sm-2 control-label">医生照片<span class="span-red">*</span></label>
									<div class="col-sm-offset-2">	
										<form id="submit_form" method="post" action="./classes/class.upload.php" target="exec_target" enctype="multipart/form-data">
											<input type="file" name="upload_file" id="upload_file">
										</form>

										<iframe id="exec_target" name="exec_target"></iframe>

										<div id="feedback"></div>
									</div>
								</div>

								<div class="row">
									<div class="form-group pull-right">
										<a href="adminQryDoctor.php" class="btn btn-primary">Cancel</a>
										<button type="submit" class="btn btn-warning" id="btn_submit">Confirm</button>
										
								 	</div>
							 	</div>

							</div>
							<!-- col-md-10 col-lg-10 col-md-offset-1 col-lg-offset-1 -->
					</div>
				</div>
			</div>
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
<script src="js/bootstrap.min.js"></script><!-- dialog --><script src="js/bootstrap-dialog.min.js"></script>
<script src="js/tm-scripts.js"></script>
<script src="js/main/pub.js"></script>
<script src="js/main/adminUpdDoctorDetail.js"></script>
</body>
</html>