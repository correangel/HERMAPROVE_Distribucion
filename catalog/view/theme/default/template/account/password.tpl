<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
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
            <div class="col-sm-12 text-center">
              <h4 class="general_title"><?php echo $heading_title; ?></h4>
            </div>
          </div>

      <p>Actualiza tu contrase&ntilde;a en cualquier momento, recuerda guardarla en un lugar seguro.</p>
      <form id="form_changepassword" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
        <fieldset>
          <legend><?php echo $text_password_old; ?></legend>
          <div class="form-group required">
            <label class="col-sm-3 control-label" for="input-password_old"><?php echo $entry_password_old; ?></label>
            <div class="col-sm-6">
              <input  required type="password" name="password_old" value="<?php echo $password_old; ?>" placeholder="<?php echo $entry_password_old; ?>" id="input-password_old" class="form-control" />
              <?php if ($error_password_old) { ?>
              <div class="text-danger"><?php echo $error_password_old; ?></div>
              <?php } ?>
            </div>
          </div>
        </fieldset>

        <fieldset>
          <legend><?php echo $text_password; ?></legend>
          <div class="form-group required">
            <label class="col-sm-3 control-label" for="input-password"><?php echo $entry_password; ?></label>
            <div class="col-sm-6">
              <input minlength="6" maxlength="40" required type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
              <?php if ($error_password) { ?>
              <div class="text-danger"><?php echo $error_password; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-3 control-label" for="input-confirm"><?php echo $entry_confirm; ?></label>
            <div class="col-sm-6">
              <input type="password" name="confirm" value="<?php echo $confirm; ?>" placeholder="<?php echo $entry_confirm; ?>" id="input-confirm" class="form-control" />
              <?php if ($error_confirm) { ?>
              <div class="text-danger"><?php echo $error_confirm; ?></div>
              <?php } ?>
            </div>
          </div>
        </fieldset>
        <div class="buttons clearfix">
          <div class="pull-left"><a href="<?php echo $back; ?>" class="btn btn-default"><?php echo $button_back; ?></a></div>
          <div class="pull-right">
            <input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-primary" />
          </div>
        </div>
      </form>



      <script type="text/javascript">
     
      $("#form_changepassword").validate({
               rules: {
                confirm: {
                  equalTo: "#input-password"
                }
              },
              messages: {
                  confirm: "Las contraseñas no coinciden",
              },
              errorClass: 'text-danger',
              highlight: function(element) {
                  $(element).closest(".form-group").addClass('has-error');
                  console.log(element);

              }, unhighlight: function(element) {
                  $(element).closest(".form-group").removeClass('has-error');
              }
          });
      </script>

      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>



<?php echo $footer; ?>