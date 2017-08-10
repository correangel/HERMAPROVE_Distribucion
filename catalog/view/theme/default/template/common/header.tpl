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

<script src="catalog/view/javascript/jquery/menu-aim/jquery.menu-aim.js" type="text/javascript"></script>

<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

<script src="catalog/view/javascript/jquery/jquery-validate/jquery.validate.min.js" type="text/javascript"></script>
<script src="catalog/view/javascript/jquery/jquery-validate/additional-methods.min.js" type="text/javascript"></script>
<script src="catalog/view/javascript/jquery/jquery-validate/messages_es.js" type="text/javascript"></script>


<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />
<link href="catalog/view/theme/default/stylesheet/stylesheet.css" rel="stylesheet">
<link href="catalog/view/theme/default/stylesheet/styleCustomized.css" rel="stylesheet">
<link href="catalog/view/theme/default/stylesheet/animate.css" rel="stylesheet">
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

 <?php if ($logged) { ?>
<script>
//alert("<?php echo $customer['name'] ?>")
  window.intercomSettings = {
    app_id: "mt5er0x6",
    name: "<?php echo $customer['name'] ?>", // Full name
    email: "<?php echo $customer['email'] ?>", // Email address
    created_at: "<?php echo strtotime($customer['created_at']) ?>",
    user_hash: "<?php echo hash_hmac('sha256', $customer['email'],'n1hsmgeJN_uQmjzEQpUhep2iAhSbTmwOxXaxn5mm');?>"
  };
</script>
<script>(function(){var w=window;var ic=w.Intercom;if(typeof ic==="function"){ic('reattach_activator');ic('update',intercomSettings);}else{var d=document;var i=function(){i.c(arguments)};i.q=[];i.c=function(args){i.q.push(args)};w.Intercom=i;function l(){var s=d.createElement('script');s.type='text/javascript';s.async=true;s.src='https://widget.intercom.io/widget/mt5er0x6';var x=d.getElementsByTagName('script')[0];x.parentNode.insertBefore(s,x);}if(w.attachEvent){w.attachEvent('onload',l);}else{w.addEventListener('load',l,false);}}})()</script>

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

            <li class="hidden-xs">
              <a href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>" style="font-weight: 500"> <?php echo $text_shopping_cart; ?></a>
            </li>

            <li class="border-left hidden-xs"><a href="<?php echo $wishlist; ?>" title="<?php echo $text_wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
            

            <li class="dropdown border-left">

            <a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $text_account; ?><span class="fa fa-chevron-down""></span></a>
                <ul class="dropdown-menu dropdown-menu-right" id="dropdown-menu-ac">
                  <li>
                  <a href="<?php echo $account; ?>"><?php echo $text_account; ?>&nbsp;<i class="fa fa-user"></i></a>
                  </li>

                  <li ><a href="<?php echo $order; ?>" title="<?php echo $text_order; ?>"><?php echo $text_order; ?> &nbsp;<i class="fa fa-history"></i> </a></li>

                  <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?>&nbsp;<i class="fa fa-credit-card"></i></a></li>

                  <hr>
                  <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
                </ul>
            </li>
            <?php } ?>
             <?php if ($logged==False) { ?>
             <li >
                  <a href="<?php echo $register; ?>" id="solicitarpromotor" class="btn"><?php echo $text_register_button; ?></a>
              </li>
              <li class="border-left">
                  <a href="<?php echo $login; ?>"><?php echo $text_login; ?></a>
              </li>
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
            <div class="col-sm-9 col-xs-12 pull-right"><?php echo $search; ?></div>
          <?php } ?>
        </div>
    </div>
    </div>
  </div>
</header>


<div class="container">
  <div class="row">
    <div class="col-sm-12 col-md-9">     
      <nav id="menu" class="navbar navbar-default">
         <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed"  data-toggle="collapse" data-target=".navbar-collapse-menu" aria-expanded="false">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <span class="navbar-brand visible-xs">Menú</span>
        </div>
        <div class="collapse navbar-collapse navbar-collapse-menu" style="padding-left: 0px;">
          <ul class="nav navbar-nav">

        <?php if ($categories) { ?>
            <li  class="dropdown">
            <a href="#" class="dropdown-toggle padleft-menu" data-toggle="dropdown" aria-expanded="true">Cat&aacute;logo de productos&nbsp;&nbsp; <span class="fa fa-chevron-down"></span></a>
                <ul id="menu_categorias" class="dropdown-menu" role="menu">
                   <?php foreach ($categories as $category) { ?>
                    <?php if ($category['children']) { ?>
                    <li data-submenu-id="submenu-<?php echo $category['name']; ?>">
                        <a class="hidden-xs"><span class="menucat_span"><?php echo $category['name']; ?></span><span class="fa fa-chevron-right"></span></a>
                        <a href="<?php echo $category['href']; ?>" class="visible-xs" style="cursor:pointer"><?php echo $category['name']; ?></a>

                        <div id="submenu-<?php echo $category['name']; ?>" class="container hidden-xs popover" style="background-image: url('image/<?php echo $category['image']; ?>');">
                            <a class="popover-title h3" href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
                            <div class="popover-content">
                             <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
                              <ul>
                                <?php foreach ($children as $child) { ?>
                                <li>
                                  <a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a><br>
                                  <span style="font-size: 10px"><?php echo $child['description']; ?></span>
                                </li>
                                <?php } ?>
                              </ul>  
                            <?php } ?>
                            </div>
                        </div>

                    </li>

                    <?php } ?>

                    <?php } ?>
                </ul>


            </li>

          <?php } ?>

          
            <li><a href="<?php echo $promociones['href']; ?>"><?php echo $promociones['text']; ?> <i class="fa fa-star" aria-hidden="true" style="color:#efef00"></i></a>
            </li>
            <li><a href="<?php echo $marcas_Asociadas['href']; ?>"><?php echo $marcas_Asociadas['text']; ?></a></li>
            <li><a href="<?php echo $blog['href']; ?>"><?php echo $blog['text']; ?></a></li>

            <!--<li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a>
            </li>-->

          </ul>
        </div>
      </nav>

    </div>
    <div class="col-sm-12 col-md-3" id="contacto_telefono">
      <div class="pull-right" style="padding-bottom: 10px">
        <a href="<?php echo $contact; ?>">
          <img src="image/icon_call.png" alt="<?php echo $telephone; ?>" title="<?php echo $telephone; ?>">
          </a>          
          <span class="colorGrayDarkDarkHermaprove" style="font-size: 11px">
            <?php echo $text_client_service; ?>:
          </span> 
          <span class="colorBlue h5" >
            <solid><?php echo $telephone; ?> </solid>
          </span>
      </div>       
    </div>
  
  </div>
</div>

<script>

        var $menu = $("#menu_categorias");
        $menu.menuAim({
            activate: activateSubmenu,
            deactivate: deactivateSubmenu
        });
        // jQuery-menu-aim: </meaningful part of the example>
        function activateSubmenu(row) {
            var $row = $(row),
                submenuId = $row.data("submenuId"),
                $submenu = $("#" + submenuId),
                height = $menu.outerHeight(),
                width = $menu.outerWidth();

            // Show the submenu
            $submenu.css({
                display: "block",
                top: -1,
                left: width - 1,  // main should overlay submenu
                //overflow:'auto'
                //height: height - 4  // padding for main dropdown's arrow
            });

            $row.find("a").addClass("maintainHover");
        }

        function deactivateSubmenu(row) {
            var $row = $(row),
                submenuId = $row.data("submenuId"),
                $submenu = $("#" + submenuId);

            $submenu.css("display", "none");
            $row.find("a").removeClass("maintainHover");
        }
        $("#menu_categorias li").click(function(e) {
            e.stopPropagation();
        });

        $(document).click(function() {
            $(".popover").css("display", "none");
            $("a.maintainHover").removeClass("maintainHover");
        });

    </script>


<?php if( (!$logged) and (!isset($registerView)) ) { ?>

<!--Este modal es el que se usa en todos los productos para que cuando un usuario no ha ingresado a la sesion deba ingresar o registrarse-->
<div class="modal fade" id="modalAddCart" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Registra o accede a tu cuenta</h4>
      </div>
      <div class="modal-body">

           <div class="row">
            <div class="col-sm-8 col-sm-push-4">
            <div class="well" style=" border-left: 1px solid #e3e3e3">
              <h3><?php echo $text_returning_customer; ?></h3>
              <p><strong style="font-weight: 600;"><?php echo $text_i_am_returning_customer; ?></strong></p>
              <form id="form_login" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                <div class="form-group">
                  <label class="control-label" for="input-email"><?php echo $entry_email; ?></label>
                  <input required type="email" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
                </div>
                <div class="form-group" style="margin-bottom:0px">
                  <label class="control-label" for="input-password"><?php echo $entry_password; ?></label>
                  <input required type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
                </div>
                 <div class="row">
                  <div class="col-sm-12">
                  <p class="pull-right"><a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a></p>
                  </div>
                </div>
                <div class="row">
                  <div class="col-sm-12">
                    <input type="submit" value="<?php echo $button_login; ?>" class="btn btn-primary pull-right" />
                  </div>   
                </div>
                
                <?php if ($redirect) { ?>
                <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
                <?php } ?>
              </form>

              <script>
                  $("#form_login").validate({
                      errorClass: 'text-danger',
                      highlight: function(element) {
                          $(element).closest(".form-group").addClass('has-error');
                          console.log(element);

                      }, unhighlight: function(element) {
                          $(element).closest(".form-group").removeClass('has-error');
                      }
                  });
              </script>


            </div>
        </div>
        <div class="col-sm-4 col-sm-pull-8">
          <div class="well">
            <h3><?php echo $text_register; ?></h3>
            <p><strong style="font-weight: 600;"><?php echo $text_new_customer; ?></strong></p>
            <p align="justify"><?php echo $text_register_account; ?></p>
            <div class="row">
                <div class="col-sm-12">
                 <a href="<?php echo $register; ?>" class="btn btn-primary pull-right"><?php echo $button_continue; ?></a></div>
                </div>   
              </div>

           
        </div>

      </div>


        
      </div>
    </div>
  </div>
</div>

             <?php } ?>    