<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
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
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>



<?php echo $footer; ?>