<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />
<link href="catalog/view/theme/default/stylesheet/stylesheet.css" rel="stylesheet">
<link href="catalog/view/theme/default/stylesheet/styleCustomized.css" rel="stylesheet">
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>
</head>
<body class="<?php echo $class; ?>">

<header id="top">
  <div class="container">
    <div class="row">
      <div class="col-sm-12">
          <ul class="nav nav-pills pull-right" id="topbar">
            <li class=""><?php echo $language; ?></li>


            <?php if ($logged) { ?>

            <li ><a href="<?php echo $wishlist; ?>" title="<?php echo $text_wishlist; ?>"><?php echo $text_wishlist; ?> &nbsp;<i class="fa fa-heart"></i> </a></li>

            <!--<li class="hidden-xs border-left"><a href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>"><?php echo $text_checkout; ?> <i class="fa fa-share"></i> </a></li>-->
             
            <li class="dropdown border-left">

            <a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $text_account; ?><span class="fa fa-chevron-down""></span></a>
                <ul class="dropdown-menu dropdown-menu-right" id="dropdown-menu-ac">
                  <li>
                  <a href="<?php echo $account; ?>"><?php echo $text_account; ?>&nbsp;<i class="fa fa-user"></i></a>
                  </li>
                  <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?>&nbsp;<i class="fa fa-history"></i></a></li>
                  <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?>&nbsp;<i class="fa fa-credit-card"></i></a></li>
                  <hr>
                  <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
                </ul>
              </li>
            <?php } ?>
             <?php if ($logged==False) { ?>
              <li>
                  <a href="<?php echo $login; ?>"><?php echo $text_login; ?></a>
              </li>
              <li class="border-left" ><a id="link_registrar" href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
                <?php } ?>
          </ul>
      </div>
    </div>
    <div class="row">
      <?php if ($logged) { ?>
        <div class="col-md-6 col-sm-12">
       <?php } else { ?>
        <div class="col-md-7 col-sm-7">
        <?php } ?>
          <div class="row">
            <div class="col-sm-6">
              <div id="logo" >
                <?php if ($logo) { ?>
                <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
                <?php } else { ?>
                <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
                <?php } ?>
              </div>
            </div>
             <div class="col-sm-6 hidden-xs hidden-sm">
                <div id='company_description' style="color:#FECE4E"><?php echo $text_company_description; ?></div>
              </div>
          </div>
        </div>
     
      <?php if ($logged) { ?>
        <div class="col-md-6 col-sm-12 col-xs-12">
          <div class="row">
            <div class="col-sm-4 hidden-xs pull-right"><?php echo $cart; ?></div>
            <div class="col-sm-7 col-xs-12 pull-right"><?php echo $search; ?></div>
          </div>
          <div class="row visible-xs">
            <div class="col-xs-7 pull-right"><?php echo $cart; ?></div>
          </div>

        <?php } else { ?>
        <div class="col-md-5 col-sm-5 col-xs-12">
          <div class="row">
            <div class="col-sm-10 col-xs-12 pull-right"><?php echo $search; ?></div>
          <?php } ?>
        </div>
    </div>
    </div>
  </div>
</header>


<div class="container">
  <div class="row">
    <div class="col-sm-9">      

      <nav id="menu" class="navbar">
        <div class="navbar-header"><span id="category" class="visible-xs"></span>
          <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse-menu"><i class="fa fa-bars"></i></button>
        </div>
        <div class="collapse navbar-collapse navbar-collapse-menu">
          <ul class="nav navbar-nav">
            <li class="hidden-xs"><a href="" style="padding-left: 0px">Inicio</a>
            <li class="visible-xs"><a href="">Inicio</a>
            </li>

            <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true"><?php echo $text_category; ?>&nbsp;&nbsp; <span class="fa fa-chevron-down"></span></a>
                <ul class="dropdown-menu dropdown-menu-right">
                  <li><a href="#">Categoria 1</a></li> 
                  <li><a href="#">Categoria 2</a></li> 
                  <li><a href="#">Categoria 3</a></li> 
                  <li><a href="#">Categoria 4</a></li> 

                </ul>          
            </li>

            <li><a href="">Novedades</a>
            </li>

            <li><a href="">Locales</a>
            </li>
            <li><a href="">Cont&aacute;ctenos</a>
            </li>
          </ul>
        </div>
      </nav>

    </div>
    <div class="col-sm-3">
      <div class="row">
        <div class="col-sm-12 text-center">
            <a href="<?php echo $contact; ?>">
            <img src="image/icon_call.png" alt="<?php echo $telephone; ?>" title="<?php echo $telephone; ?>">
            </a>          
            <span class="hidden-xs hidden-sm hidden-md colorGrayDarkDarkHermaprove" style="font-size: 11px">
              <?php echo $text_client_service; ?>:
            </span> 
            <span class="colorBlue h5">
              <solid><?php echo $telephone; ?> </solid>
            </span>
        </div>
        <div class="col-sm-12 text-center">
          <a href="<?php echo $contact; ?>"><i class="fa fa-phone"></i></a> <span class="hidden-xs hidden-sm hidden-md"><?php echo $telephone; ?></span>
        </div>
      </div>      
    </div>
  
  </div>
</div>

