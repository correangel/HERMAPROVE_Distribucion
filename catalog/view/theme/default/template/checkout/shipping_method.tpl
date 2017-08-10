<?php if ($error_warning) { ?>
<div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
<?php } ?>

<div class="row">
  <?php if ($shipping_methods) { ?>
    <div class="col-sm-3 col-sm-offset-1">

      <?php foreach ($shipping_methods as $shipping_method) { ?>
          <?php if (!$shipping_method['error']) { ?>
              <?php foreach ($shipping_method['quote'] as $quote) { ?>
              <div class="radio" >
                <label>
                  <?php if ($quote['code'] == $code || !$code) { ?>
                  <?php $code = $quote['code']; ?>
                  <input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" checked="checked" />
                  <?php } else { ?>
                  <input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" />
                  <?php } ?>
                  <strong><?php echo $quote['title']; ?></strong> - <?php echo $quote['text']; ?>
                </label>
              </div>
              <?php } ?>
          <?php } else { ?>
          <div class="alert alert-danger"><?php echo $shipping_method['error']; ?></div>
          <?php } ?>
      <?php } ?>
      </div>
  <?php } ?>
  <div class="col-sm-6">
    <p><strong><?php echo $text_comments; ?></strong></p>
    <textarea name="comment" rows="5" class="form-control" style="resize: none;"><?php echo $comment; ?></textarea>
  </div>
</div>
