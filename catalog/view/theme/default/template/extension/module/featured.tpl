<div class="row">
  
  <div class="col-sm-12 text-center">

    <h4><?php echo $heading_title; ?></h4>

  </div>
  <div class="col-sm-12">
    <?php foreach ($products as $product) { ?>
    <div class="product-layout col-lg-4 col-md-4 col-sm-6 col-xs-12">

      <div class="product-thumb transition flipInX">
        <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
        <div class="caption">
          <h4 class="text-center">
            <a href="<?php echo $product['href']; ?>"><?php echo substr($product['name'], 0, 40); ?>
              <?php if (strlen ($product['name']) > 25) { ?>
                ...
              <?php } ?>
            </a>  
          <div class="rating text-center">
            <?php for ($i = 1; $i <= 5; $i++) { ?>
            <?php if ($product['rating'] < $i) { ?>
            <span class="fa fa-stack">
              <i class="fa fa-star-o fa-stack-2x"></i>
            </span>
            <?php } else { ?>
            <span class="fa fa-stack">
              <i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x" ></i>
            </span>
            <?php } ?>
            <?php } ?>
          </div>
          </h4>
          <h5 class="product-manufacturer text-center"><?php echo $product['manufacturer'];?></h5>
          <!--<p><?php echo $product['description']; ?></p>-->
          <?php if ($product['price']) { ?>
            <p class="price">
              <?php if (!$product['special']) { ?>
                <?php echo $product['price']; ?>
              <?php } else { ?>
                <span class="price-new"><?php echo $product['special']; ?></span>
                <span class="price-old"><?php echo $product['price']; ?></span>
              <?php } ?>
              <?php if ($product['tax']) { ?>
                <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
              <?php } ?>
            </p>
          <?php } ?>
        </div>
        <?php if ($logged) { ?>
            <div class="button-group">
              <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
              <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
              <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
            </div>
        <?php } ?>
      </div>     



    </div>
    <?php } ?>
  </div>
</div>