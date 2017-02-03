<?php if ($error_warning) { ?>
<div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
<?php } ?>

<div class="row">
  <?php if ($payment_methods) { ?>

    <div class="col-sm-3 col-sm-offset-1">

      <?php foreach ($payment_methods as $payment_method) { ?>

      <div class="radio">
        <label>
          <?php if ($payment_method['code'] == $code || !$code) { ?>
          <?php $code = $payment_method['code']; ?>
          <input type="radio" id="payment_method1" name="payment_method" value="<?php echo $payment_method['code']; ?>" checked="checked" />
          <?php } else { ?>
          <input type="radio" id="payment_method2"  name="payment_method" value="<?php echo $payment_method['code']; ?>" />
          <?php } ?>
          <?php echo $payment_method['title']; ?>
          <?php if ($payment_method['terms']) { ?>
          (<?php echo $payment_method['terms']; ?>)
          <?php } ?>
        </label>
      </div>
      <?php } ?>

    </div>

  <?php } ?>

  <div class="col-sm-6">
      <p><strong><?php echo $text_comments; ?></strong></p>
    <textarea name="comment" rows="5" class="form-control" style="resize: none;"><?php echo $comment; ?></textarea>

    <?php if ($text_agree) { ?>
        <div class="buttons">
          <div class="pull-right"><?php echo $text_agree; ?>
            <?php if ($agree) { ?>
            <input type="checkbox" name="agree" value="1" checked="checked" />
            <?php } else { ?>
            <input type="checkbox" name="agree" value="1" />
            <?php } ?>
            &nbsp;
            <!--  <input type="button" value="<?php echo $button_continue; ?>" id="button-payment-method" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary" />
          </div>-->
          </div>
        </div>
      <?php } ?>
        
  </div>
</div>


