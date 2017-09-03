<?php if (isset($products)) { ?>
    <link href="catalog/view/javascript/jquery/tablesaw/tablesaw.css" rel="stylesheet" media="screen" />


    <div id="shopping-cart">

      <?php if ($attention) { ?>
      <div class="alert alert-info">
      <i class="fa fa-info-circle"></i> <?php echo $attention; ?>
        <button type="button" class="close" data-dismiss="alert">&times;</button>
      </div>
      <?php } ?>

      <?php if ($success) { ?>
      <div class="alert alert-success">
      <i class="fa fa-check-circle"></i> <?php echo $success; ?>
        <button type="button" class="close" data-dismiss="alert">&times;</button>
      </div>
      <?php } ?>

      <?php if ($error_warning) { ?>
      <div class="alert alert-danger">
      <i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      </div>
      <?php } ?>

      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">       
          <table class="table table-bordered tablesaw table-hover" data-tablesaw-sortable data-tablesaw-sortable-switch style="background-color:white">
            <thead>
              <tr style="background-color: #74B65E;color: white">
                <th class="hidden-xs"><?php echo $column_image; ?></th>
                <th scope="col" data-tablesaw-sortable-col data-tablesaw-sortable-default-col data-tablesaw-priority="3"><?php echo $column_name; ?></th>
                <th scope="col" data-tablesaw-sortable-col data-tablesaw-priority="2"><?php echo $column_model; ?></th>
                <th scope="col"><?php echo $column_quantity; ?></th>
                <th scope="col" data-tablesaw-sortable-col data-tablesaw-priority="4"><?php echo $column_price; ?></th>
                <th class="hidden-xs" scope="col"><?php echo $column_total; ?></th>
              </tr>
            </thead>
            <tbody>
              <?php foreach ($products as $product) { ?>
              <tr>
                <td class="hidden-xs" style="text-align: center;"><?php if ($product['thumb']) { ?>
                  <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
                  <?php } ?></td>
                <td >
                <a class="text-resp" href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?>
                  <?php if (!$product['stock']) { ?>
                    <span class="text-danger" style="clear: both">***</span></a>
                  <?php }else { ?>
                    </a>
                  <?php } ?>

                  <?php if ($product['option']) { ?>
                  <?php foreach ($product['option'] as $option) { ?>
                  <br />
                  <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
                  <?php } ?>
                  <?php } ?>
                  <?php if ($product['reward']) { ?>
                  <br />
                  <small><?php echo $product['reward']; ?></small>
                  <?php } ?>
                  <?php if ($product['recurring']) { ?>
                  <br />
                  <span class="label label-info"><?php echo $text_recurring_item; ?></span> <small><?php echo $product['recurring']; ?></small>
                  <?php } ?>

                </td>
                <td ><?php echo $product['model']; ?></td>
                <td>
                  <div class="input-group btn-block" style="width: 150px">
                    <input type="text" name="quantity[<?php echo $product['cart_id']; ?>]" value="<?php echo $product['quantity']; ?>" class="form-control input_litt quantity" />
                    <span class="input-group-btn">
                      <button type="submit" data-toggle="tooltip" title="<?php echo $button_update; ?>" class="btn link link_edit"><i class="fa fa-refresh"></i></button>
                      <button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn link link_delete" onclick="cart.remove('<?php echo $product['cart_id']; ?>');"><i class="fa fa-times-circle"></i></button>
                    </span>
                  </div>
                </td>
                <td ><?php echo $product['price']; ?></td>
                <td class=" hidden-xs"><?php echo $product['total']; ?></td>
              </tr>
              <?php } ?>

              <?php foreach ($vouchers as $voucher) { ?>
              <tr>
                <td></td>
                <td class="text-left"><?php echo $voucher['description']; ?></td>
                <td class="text-left"></td>
                <td class="text-left"><div class="input-group btn-block" style="max-width: 200px;">
                    <input type="text" name="" value="1" size="1" disabled="disabled" class="form-control" />
                    <span class="input-group-btn">
                    <button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger" onclick="voucher.remove('<?php echo $voucher['key']; ?>');"><i class="fa fa-times-circle"></i></button>
                    </span></div></td>
                <td class="text-right"><?php echo $voucher['amount']; ?></td>
                <td class="text-right"><?php echo $voucher['amount']; ?></td>
              </tr>
              <?php } ?>

            </tbody>
          </table>
      </form>

      <div class="row">
          <div class="col-sm-6">
              <?php if ($modules) { ?>
              <h4><?php echo $text_next; ?></h4>
              <p><?php echo $text_next_choice; ?></p>
              <div class="panel-group" id="accordion">
                <?php foreach ($modules as $module) { ?>
                <?php echo $module; ?>
                <?php } ?>
              </div>
              <?php } ?>
          </div>
          <div class="col-sm-4 col-sm-offset-2">
            <table class="table table-bordered" style="background-color: white">
              <?php foreach ($totals as $total) { ?>
              <tr>
                <td class="text-center"><strong><?php echo $total['title']; ?>:</strong></td>
                <td class="text-center"><?php echo $total['text']; ?></td>
              </tr>
              <?php } ?>
            </table>
          </div>
      </div>

    </div>

    <script src="catalog/view/javascript/jquery/tablesaw/tablesaw-init.js" type="text/javascript"></script>

     <script type="text/javascript">
        $('.quantity').bind('keypress', function (event) {
            var charCode = event.charCode;
            if (charCode != 0) {
              if (charCode < 48 || charCode > 57) {
                event.preventDefault();
              }
            }
          });
        
      </script>

<?php }else { ?>

<br>
<fieldset>
        <div class="panel-body" style="background-color: transparent;padding-top: 0px">
          <?php echo $text_error; ?>
          <div class="buttons clearfix">
            <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
          </div>
        </div>
</fieldset>

<?php } ?>