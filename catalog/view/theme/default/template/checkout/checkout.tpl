

<script src="catalog/view/javascript/jquery/tablesaw/tablesaw.js" type="text/javascript"></script>


<?php echo $header; ?>

<link href="catalog/view/javascript/jquery/jquery-steps/jquery.steps.css" rel="stylesheet" media="screen" />

<script src="catalog/view/javascript/jquery/jquery-steps/jquery.steps.min.js" type="text/javascript"></script>

<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>

         <div id="shopping-process">

            <h3><div style="display: block;"><i class="section-icon fa fa-shopping-cart"></i></div>1. Carro de Compras</h3>

            <section>
                <div id="collapse-cart-shopping">
                    <?php echo $cart; ?>
                </div>
            </section>

          <h3> <div style="display: block;"><i class="section-icon fa fa-file-text"></i></div> 2. Facturaci&oacute;n</h3>
          <section>
                <fieldset>
                    <legend><?php echo $text_checkout_payment_address; ?></legend>
                     <div id="collapse-payment-address">
                        <div class="panel-body" style="background-color: transparent;padding-top: 0px"><?php echo $payment_address ?></div>
                    </div>
                </fieldset>
                <fieldset>
                    <legend><?php echo $text_checkout_payment_method; ?></legend>
                     <div id="collapse-payment-method">
                        <div class="panel-body" style="background-color: transparent;padding-top: 0px"><?php echo $payment_method ?></div>
                    </div>
                </fieldset>
          </section>

           <?php if ($shipping_required) { ?>
          <h3> <div style="display: block;"><i class="section-icon fa fa-truck"></i></div>3. Datos de Env&iacute;o</h3>
          <section>

                <fieldset>
                <legend><?php echo $text_checkout_shipping_address; ?></legend>
                <div id="collapse-shipping-address">
                    <div class="panel-body" style="background-color: transparent;padding-top: 0px"><?php echo $shipping_address ?></div>
                  </div>
                </fieldset>

                <fieldset>
                    <legend><?php echo $text_checkout_shipping_method; ?>
                    </legend>
                     <div id="collapse-shipping-method">
                        <div id="div-shipping-method" class="panel-body" style="background-color: transparent;padding-top: 0px"><?php echo $shipping_method ?></div>
                      </div>
                </fieldset>

          </section>
          <?php } ?>


          <h3> <div style="display: block;"><i class="section-icon fa fa-check-circle"></i></div>Confirmar compra</h3>
          <section>
                <fieldset>
                    <legend><?php echo $text_checkout_confirm; ?></legend>
                     <div id="collapse-checkout-confirm">
                        <div class="panel-body" style="background-color: transparent;padding-top: 0px;">
                        <div class="col-sm-12" id="loading-gif" style="display: none; text-align: center">
                            <img src="image/loading.gif" alt="Loading" title="Loading">
                        </div>

                        </div>
                        <div class="col-sm-12" id="loading-gif2" style="display: none; text-align: right">
                            <img src="image/loading.gif" width="25px" alt="Loading" title="Loading">
                        </div>
                      </div>
                </fieldset>
          </section>
    </div>

      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>



<script type="text/javascript">

$(document).on('change', 'input[name=\'account\']', function() {
	if ($('#collapse-payment-address').parent().find('.panel-heading .panel-title > *').is('a')) {
		if (this.value == 'register') {
			$('#collapse-payment-address').parent().find('.panel-heading .panel-title').html('<a href="#collapse-payment-address" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_account; ?> <i class="fa fa-caret-down"></i></a>');
		} else {
			$('#collapse-payment-address').parent().find('.panel-heading .panel-title').html('<a href="#collapse-payment-address" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_payment_address; ?> <i class="fa fa-caret-down"></i></a>');
		}
	} else {
		if (this.value == 'register') {
			$('#collapse-payment-address').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_account; ?>');
		} else {
			$('#collapse-payment-address').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_payment_address; ?>');
		}
	}
});

// Payment Address
//Enviar formulario de agregar direccion de facturacion, (Funcion ya usada)
function enviarform_paymentAddress(form) {
    $.ajax({
        url: 'index.php?route=checkout/payment_address/save',
        type: 'post',
        data: $('#collapse-payment-address input[type=\'text\'], #collapse-payment-address input[type=\'date\'], #collapse-payment-address input[type=\'datetime-local\'], #collapse-payment-address input[type=\'time\'], #collapse-payment-address input[type=\'password\'], #collapse-payment-address input[type=\'checkbox\']:checked, #collapse-payment-address input[type=\'radio\']:checked, #collapse-payment-address input[type=\'hidden\'], #collapse-payment-address textarea, #collapse-payment-address select'),
        dataType: 'json',
        beforeSend: function() {
            $('#button-payment-address').button('loading');
        },
        complete: function() {
            $('#button-payment-address').button('reset');
        },
        success: function(json) {
            $('.alert, .text-danger').remove();

            if (json['redirect']) {
                location = json['redirect'];
            } else if (json['error']) {
                if (json['error']['warning']) {
                    $('#collapse-payment-address .panel-body').prepend('<div class="alert alert-warning">' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                }

                for (i in json['error']) {
                    var element = $('#input-payment-' + i.replace('_', '-'));

                    if ($(element).parent().hasClass('input-group')) {
                        $(element).parent().after('<div class="text-danger">' + json['error'][i] + '</div>');
                    } else {
                        $(element).after('<div class="text-danger">' + json['error'][i] + '</div>');
                    }
                }
                // Highlight any found errors
                $('.text-danger').parent().parent().addClass('has-error');
            } else {
                $.ajax({
                    url: 'index.php?route=checkout/payment_address',
                    dataType: 'html',
                    success: function(html) {
                        $('#collapse-payment-address .panel-body').html(html);
                        $('html, body').animate({ scrollTop: 0 }, 'slow');
						$.ajax({
							url: 'index.php?route=checkout/shipping_address',
							dataType: 'html',
							success: function(html) {
								$('#collapse-shipping-address .panel-body').html(html);
								$('html, body').animate({ scrollTop: 0 }, 'slow');
							},
							error: function(xhr, ajaxOptions, thrownError) {
								alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
							}
						});
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });
            }

        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
}
//Shipping address
function enviarform_shippingAddress(form) {
    $.ajax({
        url: 'index.php?route=checkout/shipping_address/save',
        type: 'post',
        data: $('#collapse-shipping-address input[type=\'text\'], #collapse-shipping-address input[type=\'date\'], #collapse-shipping-address input[type=\'datetime-local\'], #collapse-shipping-address input[type=\'time\'], #collapse-shipping-address input[type=\'password\'], #collapse-shipping-address input[type=\'checkbox\']:checked, #collapse-shipping-address input[type=\'radio\']:checked, #collapse-shipping-address textarea, #collapse-shipping-address select'),
        dataType: 'json',
        beforeSend: function() {
			$('#button-shipping-address').button('loading');
	    },
        success: function(json) {
            $('.alert, .text-danger').remove();

            if (json['redirect']) {
                location = json['redirect'];
            } else if (json['error']) {
                $('#button-shipping-address').button('reset');

                if (json['error']['warning']) {
                    $('#collapse-shipping-address .panel-body').prepend('<div class="alert alert-warning">' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                }

				for (i in json['error']) {
					var element = $('#input-shipping-' + i.replace('_', '-'));

					if ($(element).parent().hasClass('input-group')) {
						$(element).parent().after('<div class="text-danger">' + json['error'][i] + '</div>');
					} else {
						$(element).after('<div class="text-danger">' + json['error'][i] + '</div>');
					}
				}

				// Highlight any found errors
				$('.text-danger').parent().parent().addClass('has-error');
            } else {

                $.ajax({
                    url: 'index.php?route=checkout/shipping_address',
                    dataType: 'html',
                    success: function(html) {
                        console.log(html);
                        $('#collapse-shipping-address .panel-body').html(html);
                        $('html, body').animate({ scrollTop: 0 }, 'slow');
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });
            }

        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
}

function enviarform_confirmCheckout(){
    $.ajax({
        url: 'index.php?route=checkout/confirm',
        dataType: 'html',
        beforeSend: function(){
            $('#loading-gif').show();
        },
        complete: function(){
            $('#loading-gif').hide();
        },
        success: function(html) {
            $('#collapse-checkout-confirm .panel-body').html(html);
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
}

var divSteps = $("#shopping-process");
    divSteps.steps({
    headerTag: "h3",
    bodyTag: "section",
    autoFocus: true,
    /*transitionEffect: "slide",*/
    titleTemplate: '#title#',
    saveState:true,
    /*startIndex:1,*/
    labels: {
        cancel: "Cancelar",
        current: "Paso actual:",
        pagination: "Paginación",
        finish: "Enviar compra",
        next: "Continuar",
        previous: "Atrás",
        loading: "Cargando ..."
    },
    onStepChanging: function (event, currentIndex, newIndex)
    {
        $('.actions').attr('style', 'display:block');

        if((newIndex==3 && currentIndex==0) || (newIndex==3 && currentIndex==1)){
           $('.actions').attr('style', 'display:none');
            enviarform_confirmCheckout();
            return true;
        }

        //Save each step individually
        if(currentIndex==0){
            if ( $('#collapse-cart-shopping .alert-danger').length ) {
               return false;
            }
            return true;
        }else if(currentIndex==1){
                $.ajax({
                    url: 'index.php?route=checkout/payment_address/save',
                    type: 'post',
                    data: $('#collapse-payment-address input[type=\'text\'], #collapse-payment-address input[type=\'date\'], #collapse-payment-address input[type=\'datetime-local\'], #collapse-payment-address input[type=\'time\'], #collapse-payment-address input[type=\'password\'], #collapse-payment-address input[type=\'checkbox\']:checked, #collapse-payment-address input[type=\'radio\']:checked, #collapse-payment-address input[type=\'hidden\'], #collapse-payment-address textarea, #collapse-payment-address select'),
                    dataType: 'json',
                    beforeSend: function() {
                        $('#button-payment-address').button('loading');
                    },
                    complete: function() {
                        $('#button-payment-address').button('reset');
                    },
                    success: function(json) {
                        $('.alert, .text-danger').remove();

                        if (json['redirect']) {
                            location = json['redirect'];
                        } else if (json['error']) {
                            if (json['error']['warning']) {
                                $('#collapse-payment-address .panel-body').prepend('<div class="alert alert-warning">' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                            }

                            for (i in json['error']) {
                                var element = $('#input-payment-' + i.replace('_', '-'));
                                if ($(element).parent().hasClass('input-group')) {
                                    $(element).parent().after('<div class="text-danger">' + json['error'][i] + '</div>');
                                } else {
                                    $(element).after('<div class="text-danger">' + json['error'][i] + '</div>');
                                }
                            }
                            // Highlight any found errors
                            $('.text-danger').parent().parent().addClass('has-error');
                        }else{
                            $.ajax({
                                url: 'index.php?route=checkout/payment_method/save',
                                type: 'post',
                                data: $('#collapse-payment-method input[type=\'radio\']:checked, #collapse-payment-method input[type=\'checkbox\']:checked, #collapse-payment-method textarea'),
                                dataType: 'json',
                                beforeSend: function() {
                                    $('#button-payment-method').button('loading');
                                },
                                success: function(json) {
                                    $('.alert, .text-danger').remove();

                                    if (json['redirect']) {
                                        location = json['redirect'];
                                    }else if (json['error']) {
                                        $('#button-payment-method').button('reset');
                                        if (json['error']['warning']) {
                                            $('#collapse-payment-method .panel-body').prepend('<div class="alert alert-danger">' + json['error']['warning'] +'</div>');
                                        }
                                    }
                                },
                                error: function(xhr, ajaxOptions, thrownError) {
                                    alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                                }
                            });
                        }

                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });

                if ( $('input[name=payment_address]:checked').val()=='new' || !$('input[name=agree]').is(':checked') ){
                    return false;
                }

                return true;

        }else if(currentIndex==2){
                $.ajax({
                        url: 'index.php?route=checkout/shipping_address/save',
                        type: 'post',
                        data: $('#collapse-shipping-address input[type=\'text\'], #collapse-shipping-address input[type=\'date\'], #collapse-shipping-address input[type=\'datetime-local\'], #collapse-shipping-address input[type=\'time\'], #collapse-shipping-address input[type=\'password\'], #collapse-shipping-address input[type=\'checkbox\']:checked, #collapse-shipping-address input[type=\'radio\']:checked, #collapse-shipping-address textarea, #collapse-shipping-address select'),
                        dataType: 'json',
                        beforeSend: function() {
                            $('#button-shipping-address').button('loading');
                        },
                        success: function(json) {
                            $('.alert, .text-danger').remove();

                            if (json['redirect']) {
                                location = json['redirect'];
                            } else if (json['error']) {
                                $('#button-shipping-address').button('reset');

                                if (json['error']['warning']) {
                                    $('#collapse-shipping-address .panel-body').prepend('<div class="alert alert-warning">' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                                }

                                for (i in json['error']) {
                                    var element = $('#input-shipping-' + i.replace('_', '-'));

                                    if ($(element).parent().hasClass('input-group')) {
                                        $(element).parent().after('<div class="text-danger">' + json['error'][i] + '</div>');
                                    } else {
                                        $(element).after('<div class="text-danger">' + json['error'][i] + '</div>');
                                    }
                                }

                                // Highlight any found errors
                                $('.text-danger').parent().parent().addClass('has-error');
                            } else {
                                    $.ajax({
                                        url: 'index.php?route=checkout/shipping_method/save',
                                        type: 'post',
                                        data: $('#collapse-shipping-method input[type=\'radio\']:checked, #collapse-shipping-method textarea'),
                                        dataType: 'json',
                                        beforeSend: function() {
                                            $('#button-shipping-method').button('loading');
                                        },
                                        success: function(json) {
                                            $('.alert, .text-danger').remove();

                                            if (json['redirect']) {
                                                location = json['redirect'];
                                            } else if (json['error']) {
                                                $('#button-shipping-method').button('reset');

                                                if (json['error']['warning']) {
                                                    $('#collapse-shipping-method .panel-body').prepend('<div class="alert alert-danger">' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                                                }
                                            }else if(newIndex==3){
                                                $('.actions').attr('style', 'display:none');
                                                enviarform_confirmCheckout();
                                            }
                                            return true;
                                        },
                                        error: function(xhr, ajaxOptions, thrownError) {
                                            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                                        }
                                    });
                            }

                        },
                        error: function(xhr, ajaxOptions, thrownError) {
                            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                        }
                });
               if ( $('input[name=shipping_address]:checked').val()=='new'){
                    return false;
                }
            return true;
        }else if (currentIndex==3){
            return true;
        }
        return false;
    },
    /*
    onFinishing: function (event, currentIndex)
    {
        form.validate().settings.ignore = ":disabled";
        return form.valid();
    },
    onFinished: function (event, currentIndex)
    {

    }*/
});
</script>


<?php echo $footer; ?>
