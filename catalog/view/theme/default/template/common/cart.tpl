<div id="cart" class="btn-group btn-block">
  <button type="button" data-toggle="dropdown" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-inverse btn-block dropdown-toggle"><i style="font-size: 12px" class="fa fa-shopping-cart"></i> &nbsp;&nbsp;<span id="cart-total"><?php echo $text_items; ?></span></button>

  <ul class="dropdown-menu dropdown-menu-right table-responsive">
    <?php if ($products || $vouchers) { ?>

    <li>
      <table class="table table-responsive">
        <tr >
          <td class="text-center"><?php echo $column_image; ?></td>
          <td class="text-center"><?php echo $column_name; ?></td>
          <td class="text-center"><?php echo $column_quantity; ?></td>
          <td class="text-center"><?php echo $column_total; ?></td>
          <td class="text-center">X</td>

        </tr>
        <?php foreach ($products as $product) { ?>
        <tr class="active">
          <td class="text-center"><?php if ($product['thumb']) { ?>
            <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
            <?php } ?></td>
          <td class="text-left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
            <?php if ($product['option']) { ?>
            <?php foreach ($product['option'] as $option) { ?>
            <br />
            - <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small>
            <?php } ?>
            <?php } ?>
            <?php if ($product['recurring']) { ?>
            <br />
            - <small><?php echo $text_recurring; ?> <?php echo $product['recurring']; ?></small>
            <?php } ?></td>
          <td class="text-center"><?php echo $product['quantity']; ?></td>
          <td class="text-center"><?php echo $product['total']; ?></td>
          <td class="text-center"><button type="button" onclick="cart.remove('<?php echo $product['cart_id']; ?>');" title="<?php echo $button_remove; ?>" class="btn btn-danger btn-xs"><i class="fa fa-times"></i></button></td>
        </tr>
        <?php } ?>
        <?php foreach ($vouchers as $voucher) { ?>
        <tr class="active">
          <td class="text-center"></td>
          <td class="text-left"><?php echo $voucher['description']; ?></td>
          <td class="text-right">x&nbsp;1</td>
          <td class="text-right"><?php echo $voucher['amount']; ?></td>
          <td class="text-center text-danger"><button type="button" onclick="voucher.remove('<?php echo $voucher['key']; ?>');" title="<?php echo $button_remove; ?>" class="btn btn-danger btn-xs"><i class="fa fa-times"></i></button></td>
        </tr>
        <?php } ?>
      </table>
    </li>
    <li>
        <table class="table table-bordered">
          <?php foreach ($totals as $total) { ?>
          <tr>
            <td class="text-right"><strong><?php echo $total['title']; ?></strong></td>
            <td class="text-right"><?php echo $total['text']; ?></td>
          </tr>
          <?php } ?>
        </table>

        <p class="text-right">
        <!--<a href="<?php echo $cart; ?>" class="btn btn-primary"><i class="fa fa-shopping-cart"></i> <?php echo $text_cart; ?></a>&nbsp;&nbsp;&nbsp;-->

        <a href="<?php echo $checkout; ?>" class="btn btn-primary"><i class="fa fa-shopping-cart"></i> <?php echo $text_checkout; ?></a></p>
    </li>

    <?php } else { ?>

    <li>
      <p class="text-center"><?php echo $text_empty; ?></p>
    </li>


    <?php } ?>
  </ul>
</div>
