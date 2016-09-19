<?php
include_once 'classes/Language/language.common.php';
?>
<!DOCTYPE html>
<html lang="en">
<head>
<title>sign up</title>
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
<link rel="stylesheet" href="css/bootstrapValidator.css"/>
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
                <li class="sub-menu"><a href="index-1.php">our services</a><span></span>
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
                <li class="active"><a href="sign_up_person.php">Sign up</a></li>
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
			<div class="container">
				<div class="row df_content">
					<h2 class="wow fadeInRight">诊所用户注册</h2>
					<form class="form-inline wow fadeInLeft form_add" role="form" id="signup_form">
						<fieldset>
					<!-- 		<div class="form-group has-error has-feedback">
								<!--<label class="control-label" for="inputError2">Input with error</label>
								<input type="text" class="form-control" id="inputError2" aria-describedby="inputError2Status" readonly value="Info: Please select user">
								<span class="glyphicon glyphicon-warning-sign form-control-feedback" aria-hidden="true"></span>
								<span id="inputError2Status" class="sr-only">(error)</span>
							</div> -->
							<input type="hidden" class="form-control" name="action_type" id="action_type" value="create">

							<div class="form-group">
								<label for="sele_user" class="control-label">选择用户<span class="span-red">*</span></label>
									<select class="form-control" id="sele_user" autofocus>
										<!-- <option value="0">Please select user</option> -->
										<option value="0">个人用户</option>
										<option value="1" selected>诊所用户</option>
									</select>
							</div>
							
							<div id="personal">
								<div class="form-group">
									<label for="username">用户名<span class="span-red">*</span></label>
									<input type="text" class="form-control" id="CLINIC_USER_NAME" name="CLINIC_USER_NAME">
								</div>

								<div class="form-group">
									<label for="pwd">邮箱<span class="span-red">*</span></label>
									<input type="email" class="form-control" name="CLINIC_USER_MAIL" id="CLINIC_USER_MAIL" value="shelleymyl@gmail.com">
								</div>

								<div class="form-group">
									<label for="CLINIC_USER_PWD">密码<span class="span-red">*</span></label>
									<input type="password" class="form-control" name="CLINIC_USER_PWD" id="CLINIC_USER_PWD">
								</div>

								<div class="form-group">
									<label for="CONFIME_PWD">确认密码<span class="span-red">*</span></label>
									<input type="password" class="form-control" name="CONFIME_PWD" id="CONFIME_PWD">
								</div>

								<div class="form-group">
									<label for="birthday">诊所名称<span class="span-red">*</span></label>
									<input type="text" class="form-control" name="CLINIC_NAME" id="CLINIC_NAME" value="1">
								</div>
								
	                            <div class="form-group">
									<label for="CLINIC_POSTCODE">邮编<span class="span-red">*</span></label>
									<input type="text" class="form-control" name="CLINIC_POSTCODE" id="CLINIC_POSTCODE" value="1">
								</div>

								<div class="form-group col-md-9 col-lg-9">
									<label for="CLINIC_ADDR">详细地址<span class="span-red">*</span></label>
									<input type="text" class="form-control"  style="width:81%" name="CLINIC_ADDR" id="CLINIC_ADDR" value="1">
								</div>

								<div class="form-group">
									<label for="CLINIC_SUBURB">区<span class="span-red">*</span></label>
									<input type="text" class="form-control" name="CLINIC_SUBURB" id="CLINIC_SUBURB" value="1">
								</div>

								<div class="form-group">
	                              <label for="STATE_ID">州<span class="span-red">*</span></label>
	                              <select class="form-control" id="STATE_ID" name="STATE_ID">
	                              </select>
	                            </div>
							</div>
							<div class="row">
								<div class="form-group pull-right">
									<button type="submit" class="btn btn-lg btn-primary btn-block" id="signup_ok">Sign up for free</button>
								 </div>
							</div>
							<div class="row">
								<div class="pull-right">
									<a href="sign_in.php"><strong>sign in</strong></a>
								</div>
							</div>
						</fieldset>
					</form>
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
<script src="js/jquery.cookie.js"></script>
<script src="js/bootstrapValidator.js"></script>
<script src="js/main/pub.js"></script>
<script src="js/main/sign_up_clinic.js"></script>
</body>
</html>