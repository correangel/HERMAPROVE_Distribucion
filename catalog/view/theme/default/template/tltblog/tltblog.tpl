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
    <div id="content" class="<?php echo $class; ?>" style="padding:0px 40px">
    	<?php echo $content_top; ?>
        <h3 style="color:#5F4828"><?php echo $heading_title; ?></h3>
        
        <h4 style="font-size: 13px">Por <?php echo $author; ?> el <?php echo $created_at; ?></h4>

        <?php if ($tags) { ?>
          
          <?php echo $text_tags; ?>&nbsp;
            <?php for ($i = 0; $i < count($tags); $i++) { ?>
              <?php if ($i < (count($tags) - 1)) { ?>
                <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['title']; ?></a>,&nbsp;
              <?php } else { ?>
                <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['title']; ?></a>
              <?php } ?>
            <?php } ?>
        <?php } ?>
        
        <hr style="margin-top: 10px;">
        
        <div class="col-sm-12 text-center">
          <p><img class="img-thumbnail " src="<?php echo $blog_image; ?>"></p>
        </div>
        
      	<div class="text_justify">
          <?php echo $description; ?>        
        </div>

      <?php if ($products) { ?>
      <br>
      <h4><?php echo $text_related; ?></h4>
      <hr>
      <div class="row">
        <?php $i = 0; ?>
        <?php foreach ($products as $product) { ?>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-lg-6 col-md-6 col-sm-12 col-xs-12'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-lg-4 col-md-4 col-sm-6 col-xs-12'; ?>
        <?php } else { ?>
        <?php $class = 'col-lg-3 col-md-3 col-sm-6 col-xs-12'; ?>
        <?php } ?>
        <div class="<?php echo $class; ?>">



      <div class="product-thumb transition">
        <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
        <div class="caption">
          <h4 class="text-center">
          <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>  
          <div class="rating text-center">
            <?php for ($i = 1; $i <= 5; $i++) { ?>
            <?php if ($product['rating'] < $i) { ?>
            <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x" style="font-size:11px"></i></span>
            <?php } else { ?>
            <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x" style="font-size:11px"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
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
        <?php } else{?>
              <div class="button-group-nolog">
                <button id="add_cart" type="button" data-toggle="modal" data-target="#modalAddCart"><i class="fa fa-shopping-cart"></i> <span><?php echo $button_cart; ?></span></button>
              </div>
        <?php } ?>

      </div>





        </div>
        <?php if (($column_left && $column_right) && ($i % 2 == 0)) { ?>
        <div class="clearfix visible-md visible-sm"></div>
        <?php } elseif (($column_left || $column_right) && ($i % 3 == 0)) { ?>
        <div class="clearfix visible-md"></div>
        <?php } elseif ($i % 4 == 0) { ?>
        <div class="clearfix visible-md"></div>
        <?php } ?>
        <?php $i++; ?>
        <?php } ?>
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<script type="text/javascript"><!--
$(document).ready(function() {
	$('.popup_imgs').magnificPopup({
		type:'image',
		delegate: 'a',
		gallery: {
			enabled:true
		}
	});
});
//--></script>
<?php echo $footer; ?>
