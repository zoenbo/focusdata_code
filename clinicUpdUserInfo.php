<?php
include_once 'classes/Language/language.common.php';
?>
	<!DOCTYPE html>
	<html lang="en">

	<head>
		<title>our services</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="icon" href="img/favicon.ico" type="image/x-icon">
		<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />
		<meta name="description" content="Your description">
		<meta name="keywords" content="Your keywords">
		<meta name="author" content="Your name">
		<!--CSS-->
		<link rel="stylesheet" href="css/bootstrap.css">
		<!-- dialog -->
		<link href="css/bootstrap-dialog.min.css" rel="stylesheet" type="text/css" />
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

		<style>
			.material-switch>input[type="checkbox"] {
				display: none;
			}

			.material-switch>label {
				cursor: pointer;
				height: 0px;
				position: relative;
				width: 40px;
			}

			.material-switch>label::before {
				background: rgb(0, 0, 0);
				box-shadow: inset 0px 0px 10px rgba(0, 0, 0, 0.5);
				border-radius: 8px;
				content: '';
				height: 16px;
				margin-top: -8px;
				position: absolute;
				opacity: 0.3;
				transition: all 0.4s ease-in-out;
				width: 40px;
			}

			.material-switch>label::after {
				background: rgb(255, 255, 255);
				border-radius: 16px;
				box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.3);
				content: '';
				height: 24px;
				left: -4px;
				margin-top: -8px;
				position: absolute;
				top: -4px;
				transition: all 0.3s ease-in-out;
				width: 24px;
			}

			.material-switch>input[type="checkbox"]:checked+label::before {
				background: inherit;
				opacity: 0.5;
			}

			.material-switch>input[type="checkbox"]:checked+label::after {
				background: inherit;
				left: 20px;
			}
		</style>



	</head>

	<body>
		<!--header-->
		<div class="container bars">
			<em class="bars_"></em>
		</div>
		<?php
				include_once 'classes/Menu/menu.php';
				?>
			<header>

				<h1 class="navbar-brand navbar-brand_">
					<a href="index.php"><img src="img/<?php echo $lang['Lang0004']; ?>"
				alt="logo"></a>
				</h1>
			</header>

			<!--content-->
			<div class="content">
				<div class="stellar-section">
					<div class="thumb-box9" data-stellar-background-ratio="0.1">
						<div class="container">
							<div class="row left_con">
								<!-- <div class="col-lg-3 col-md-3 col-sm-3 wow fadeInUp" data-wow-delay="0.1s"> -->
								<div class="col-lg-3 col-md-3 col-sm-3">
									<div class="list-group">
										<a href="clinicUpdUserInfo.php" class="list-group-item active" id="user_appointment_recoder">
											<!-- 修改诊所用户信息-->
											<?php echo $lang['Lang0229']; ?>
										</a>
										<a href="clinicQryDoctor.php" class="list-group-item" id="user_upd_person_info">
											<!-- 医生信息管理-->
											<?php echo $lang['Lang0230']; ?>
										</a>
										<a href="clinicUpdUserPwd.php" class="list-group-item" id="user_upd_person_pwd">
											<!-- 修改诊所用户密码-->
											<?php echo $lang['Lang0231']; ?>
										</a>
									</div>
								</div>

								<div class="col-lg-9 col-md-9 col-sm-9 wow fadeInUp" data-wow-delay="0.1s">
									<!-- <div class="col-lg-9 col-md-9 col-sm-9"> -->
									<div class="PersonUser">
										<h2>
											<!-- 修改诊所用户信息-->
											<?php echo $lang['Lang0229']; ?>
										</h2>
										<div class="row">

											<form class="form-inline" role="form" id="clinicUpdUserInfo">

												<input type="hidden" class="form-control" name="action_type" id="action_type" value="update"> <input type="hidden"
												 class="form-control" name="CLINIC_USER_ID" id="CLINIC_USER_ID">

												<input type="hidden" class="form-control" name="CLINIC_LAT" id="CLINIC_LAT">
												<input type="hidden" class="form-control" name="CLINIC_LNG" id="CLINIC_LNG">



												<div class="form-group col-md-9">
													<label for="CLINIC_USER_MAIL" class="col-md-2">
												<!-- 邮箱-->
												<?php echo $lang['Lang0268']; ?><span class="span-red">*</span>
											</label> <input type="text" class="form-control" name="CLINIC_USER_MAIL" id="CLINIC_USER_MAIL" readonly="readonly">
												</div>

												<div class="form-group col-md-6">
													<label for="birthday" class="col-md-3 control-label">
												<!-- 诊所名称-->
												<?php echo $lang['Lang0269']; ?><span class="span-red">*</span>
											</label> <input type="text" class="form-control" name="CLINIC_NAME" id="CLINIC_NAME">
												</div>

												<div class="form-group col-md-6"></div>

												<div class="form-group col-md-9 col-lg-9">
													<label for="CLINIC_ADDR" class="col-md-2">
												<!-- 详细地址-->
												<?php echo $lang['Lang0270']; ?><span class="span-red">*</span>
											</label> <input type="text" class="form-control" style="width: 81%" name="CLINIC_ADDR" id="CLINIC_ADDR"
													 value="1">
												</div>

												<div class="form-group col-md-6">
													<label for="CLINIC_SUBURB" class="col-md-3">
												<!-- 区-->
												<?php echo $lang['Lang0271']; ?><span class="span-red">*</span>
											</label> <input type="text" class="form-control" name="CLINIC_SUBURB" id="CLINIC_SUBURB" value="1">
												</div>

												<div class="form-group col-md-6">
													<label for="STATE_ID" class="col-md-3">
												<!-- 州-->
												<?php echo $lang['Lang0272']; ?><span class="span-red">*</span>
											</label> <select class="form-control" id="STATE_ID" name="STATE_ID">
											</select>
												</div>

												<div class="form-group col-md-6">
													<label for="CLINIC_POSTCODE" class="col-md-3">
												<!-- 邮编-->
												<?php echo $lang['Lang0273']; ?><span class="span-red">*</span>
											</label> <input type="text" class="form-control" name="CLINIC_POSTCODE" id="CLINIC_POSTCODE" value="1">
												</div>


												<div class="form-group col-md-12">
													<div class="col-md-5">
														Bulk billing
														<div class="material-switch pull-right">
															<input id="BULK_BILLING" name="BULK_BILLING" type="checkbox" />
															<label for="BULK_BILLING" class="label-success"></label>
														</div>
													</div>
												</div>
												<div class="form-group col-md-12">
													<div class="col-md-5">
														Late hour services (after 6pm)
														<div class="material-switch pull-right">
															<input id="LATE_HOUR_SERVICES" name="LATE_HOUR_SERVICES" type="checkbox" />
															<label for="LATE_HOUR_SERVICES" class="label-success"></label>
														</div>
													</div>
												</div>
												<div class="form-group col-md-12">
													<div class="col-md-5">
														Free parking
														<div class="material-switch pull-right">
															<input id="FREE_PARKING" name="FREE_PARKING" type="checkbox" />
															<label for="FREE_PARKING" class="label-success"></label>
														</div>
													</div>
												</div>
												<div class="form-group col-md-12">
													<div class="col-md-5">
														Wheelchair access
														<div class="material-switch pull-right">
															<input id="WHEELCHAIR_ACCESS" name="WHEELCHAIR_ACCESS" type="checkbox" />
															<label for="WHEELCHAIR_ACCESS" class="label-success"></label>
														</div>
													</div>
												</div>
												<div class="form-group col-md-12">
													<div class="col-md-5">
														Female Doctor
														<div class="material-switch pull-right">
															<input id="FEMALE_DOCTOR" name="FEMALE_DOCTOR" type="checkbox" />
															<label for="FEMALE_DOCTOR" class="label-success"></label>
														</div>
													</div>
												</div>
												<div class="form-group col-md-12">
													<div class="col-md-5">
														Home visit
														<div class="material-switch pull-right">
															<input id="HOME_VISIT" name="HOME_VISIT" type="checkbox" />
															<label for="HOME_VISIT" class="label-success"></label>
														</div>
													</div>
												</div>
												<div class="form-group col-md-12">
													<div class="col-md-5">
														Onsite pathology collection
														<div class="material-switch pull-right">
															<input id="ONSITE_PATHOLOGY_COLLECTION" name="ONSITE_PATHOLOGY_COLLECTION" type="checkbox" />
															<label for="ONSITE_PATHOLOGY_COLLECTION" class="label-success"></label>
														</div>
													</div>
												</div>
												<div class="form-group col-md-12">
													<div class="col-md-5">
														AGPAL
														<div class="material-switch pull-right">
															<input id="AGPAL" name="AGPAL" type="checkbox" />
															<label for="AGPAL" class="label-success"></label>
														</div>
													</div>
												</div>
												<div class="form-group col-md-12">
													<label class="col-md-6 control-label">Standard 15 minute consultation</label>
													<div class="input-group">
														<span class="input-group-addon">$</span>
														<input type="text" onkeypress='return event.charCode >= 48 && event.charCode <= 57' id="STANDARD_15_MINUTE_CONSULTATION" name="STANDARD_15_MINUTE_CONSULTATION" class="form-control" placeholder="Price" />

													</div>
												</div>

												<div class="form-group col-md-12">
													<label class="col-md-6 control-label">Extended standard 30 minute consultation</label>
													
													<div class="input-group">
														<span class="input-group-addon">$</span>
														<input type="text" onkeypress='return event.charCode >= 48 && event.charCode <= 57' id="EXTEND_30_MINUTE_CONSULTATION" name="EXTEND_30_MINUTE_CONSULTATION" class="form-control" placeholder="Price" />

													</div>
												</div>

												<div class="form-group col-md-9">
													<label for="CLINIC_OVERVIEW" class="col-md-2 control-label">
												<!-- 简介-->
												<?php echo $lang['Lang0328']; ?>
											</label>
													<div class="col-md-10">
														<textarea class="form-control" name="CLINIC_OVERVIEW" id="CLINIC_OVERVIEW" cols="75" rows="10"></textarea>
													</div>
												</div>


												<input type="hidden" class="form-control" name="CLINIC_PHOTO" id="CLINIC_PHOTO">
											</form>
										</div>
										<!-- row -->

										<div class="row">
											<div class="col-md-9">
												<label for="CLINIC_PHOTO" class="col-md-2 control-label"><!-- 诊所照片--><?php echo $lang['Lang0329']; ?><span class="span-red">*</span></label>
												<div class="col-md-offset-2">
													<form id="submit_form" method="post" action="./classes/class.upload_clinic.php" target="exec_target" enctype="multipart/form-data">
														<input type="file" name="upload_file" id="upload_file">
													</form>

													<iframe id="exec_target" name="exec_target"></iframe>

													<div id="feedback"></div>
												</div>
											</div>
										</div>

										<div class="row">
											<div class="form-group pull-right">
												<button class="btn btn-primary" id="btn_ok">
										<!-- 确定-->
										<?php echo $lang['Lang0274']; ?></button>
											</div>
										</div>
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
			<?php
include_once 'classes/Footer/Footer.php';
?>
				<?php

include_once 'classes/Language/For_JS_multi_lang.php';
?>
					<!-- DataTables JavaScript -->
					<script src="bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
					<script src="bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>

					<!-- datetime -->
					<script type="text/javascript" src="js/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
					<script type="text/javascript" src="js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
					<script src="js/bootstrap.min.js"></script>
					<!-- dialog -->
					<script src="js/bootstrap-dialog.min.js"></script>
					<script src="js/tm-scripts.js"></script>
					<script src="js/main/pub.js"></script>
					<script src="js/main/clinicUpdUserInfo.js"></script>
					<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyCyZERlQBAH0_PRkVI8bu7oqx8HIBlyZG4&libraries=geometry"></script>
	</body>

	</html>