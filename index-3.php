<?php
include_once 'classes/Language/language.common.php';
?>
<!DOCTYPE html>
<html lang="en">
<head>
<title>staff</title>
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
    <?php
include_once 'classes/Menu/menu.php';
?>
    <h1 class="navbar-brand navbar-brand_"><a href="index.php"><img src="img/<?php echo $lang['Lang0004']; ?>" alt="logo"></a></h1>
</header>
<!--content-->
<div class="content">
        <div class="thumb-box11">
            <div class="container">
                <div class="box">
                    <strong class="wow fadeInUp">Join<span>Our Staff of Professionals</span></strong>
                </div>
                <div class="box1">
                    <p class="wow fadeInUp" data-wow-delay="0.1s">Ciloase magna onumsan erahaseres amaltali soeratum ursus elserase eliterta ferrosera. Aenean auctor wisi et urna. Aliquam erat volutpat. Duis ac turpis. Integer rutrum ante eu lacus. Quisque nulla.</p>
                </div>
                <a href="#" class="btn-default btn6 wow fadeInUp" data-wow-delay="0.2s">click here</a>
            </div>
        </div>
        <div class="thumb-box7">
            <div class="container">
                <h2 class="indent wow fadeInRight">Meet Our Staff</h2>
                <div class="row">
                    <div class="col-lg-3 col-md-6 col-sm-6 col-xs-6 wow fadeIn maxheight">
                        <div class="thumb-pad2-1">
                            <div class="thumbnail">
                                <figure><img src="img/page4_pic1.jpg" alt=""></figure>
                                <div class="caption">
                                    <a href="#">Edna Barton</a>
                                    <p>Beciegast nveriti vitaesaert asety kertya aset apicaboserdenerafae kertyu erauas vitaesa ertyasnemo</p>
                                </div>  
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6 col-xs-6 wow fadeIn maxheight" data-wow-delay="0.1s">
                        <div class="thumb-pad2-1">
                            <div class="thumbnail">
                                <figure><img src="img/page4_pic2.jpg" alt=""></figure>
                                <div class="caption">
                                    <a href="#">Tom James</a>
                                    <p>Beciegast nveriti vitaesaert asety kertya aset apicaboserdenerafae kertyu erauas vitaesa ertyasnemo</p>
                                </div>  
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6 col-xs-6 wow fadeIn maxheight" data-wow-delay="0.2s">
                        <div class="thumb-pad2-1">
                            <div class="thumbnail">
                                <figure><img src="img/page4_pic3.jpg" alt=""></figure>
                                <div class="caption">
                                    <a href="#">Jessica Priston</a>
                                    <p>Beciegast nveriti vitaesaert asety kertya aset apicaboserdenerafae kertyu erauas vitaesa ertyasnemo</p>
                                </div>  
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6 col-xs-6 wow fadeIn maxheight" data-wow-delay="0.3s">
                        <div class="thumb-pad2-1">
                            <div class="thumbnail">
                                <figure><img src="img/page4_pic4.jpg" alt=""></figure>
                                <div class="caption">
                                    <a href="#">Sandra Bullock</a>
                                    <p>Beciegast nveriti vitaesaert asety kertya aset apicaboserdenerafae kertyu erauas vitaesa ertyasnemo</p>
                                </div>  
                            </div>
                        </div>
                    </div>
                </div>
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
<script src="js/bootstrap.min.js"></script><!-- dialog --><script src="js/bootstrap-dialog.min.js"></script>
<script src="js/tm-scripts.js"></script>
</body>
</html>