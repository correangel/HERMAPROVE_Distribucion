<footer>
  <div class="container">
    <div class="row">
      <?php if ($informations) { ?>
      <div class="col-sm-3 col-sm-offset-2">
        <h5><?php echo $text_information; ?></h5>
        <ul class="list-unstyled">
          <?php foreach ($informations as $information) { ?>
          <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
          <?php } ?>
        </ul>
      </div>
      <?php } ?>
      <div class="col-sm-3">
        <h5><?php echo $text_service; ?></h5>
        <ul class="list-unstyled">
         
          <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
          <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
          
          <li><a href="">Promociones <i class="fa fa-star" aria-hidden="true" style="color:#efef00;background:#303030 "></i></a></li>
          <li><a href="<?php echo $blog; ?>">Novedades</a></li>
        </ul>
      </div>

      <div class="col-sm-3">
        <h5 style="color:#74B65E"><?php echo $store; ?></h5>
          <ul class="list-unstyled">
            <li><i class="fa fa-map-marker" aria-hidden="true"></i> <?php echo $address; ?></li>
            <li><i class="fa fa-phone" aria-hidden="true"></i> <?php echo $telephone; ?></li>
            <li><i class="fa fa-envelope-o" aria-hidden="true"></i> <?php echo $email; ?></li>
            <li>Guayas, Ecuador</li>
          </ul>
           <ul class="list-unstyled">
          <li style="margin-top: 20px;">
            <a  target="_blank"  href="https://www.facebook.com/hermaprove/"><i class="fa fa-facebook" aria-hidden="true" style="font-size: 20px"></i> </a>
              &nbsp;<a target="_blank"  href="https://www.instagram.com/hermaprove_ec/"><i class="fa fa-instagram" aria-hidden="true" style="font-size: 20px"></i></a>
              &nbsp;<a target="_blank"  href="https://twitter.com/hermaprove"><i class="fa fa-twitter" aria-hidden="true" style="font-size: 20px"></i></a>

          </li>
          </ul>
      </div>
    </div>
    <p style="text-align: center; margin-bottom: 50px;margin-top:30px"><?php echo $powered; ?></p>
  </div>
</footer>

            <?php if ($live_search_ajax_status):?>
	            <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/live_search.css" />
				<script type="text/javascript"><!--
					var live_search = {
						selector: '#search input[name=\'search\']',
						text_no_matches: '<?php echo $text_empty; ?>',
						height: '60px'
					}

					$(document).ready(function() {
						var html = '';
						html += '<div class="live-search">';
						html += '	<ul>';
						html += '	</ul>';
						html += '<div class="result-text"></div>';
						html += '</div>';

						//$(live_search.selector).parent().closest('div').after(html);
						$(live_search.selector).after(html);

						$(live_search.selector).autocomplete({
							'source': function(request, response) {
								var filter_name = $(live_search.selector).val();
								var live_search_min_length = '<?php echo (int)$live_search_min_length; ?>';
								if (filter_name.length < live_search_min_length) {
									$('.live-search').css('display','none');
								}
								else{
									var html = '';
									html += '<li style="text-align: center;height:10px;">';
									html +=	'<img class="loading" src="catalog/view/theme/default/image/loading.gif" />';
									html +=	'</li>';
									$('.live-search ul').html(html);
									$('.live-search').css('display','block');

									$.ajax({
										url: 'index.php?route=product/live_search&filter_name=' +  encodeURIComponent(filter_name),
										dataType: 'json',
										success: function(result) {
											var products = result.products;
											$('.live-search ul li').remove();
											$('.result-text').html('');
											if (!$.isEmptyObject(products)) {
												var show_image = <?php echo $live_search_show_image;?>;
												var show_price = <?php echo $live_search_show_price;?>;
												var show_description = <?php echo $live_search_show_description;?>;
												$('.result-text').html('<a href="<?php echo $live_search_href;?>'+filter_name+'" class="view-all-results"><?php echo $text_view_all_results;?> ('+result.total+')</a>');

												$.each(products, function(index,product) {
													var html = '';
													
													html += '<li>';
													html += '<a href="' + product.url + '" title="' + product.name + '">';
													if(product.image && show_image){
														html += '	<div class="product-image"><img alt="' + product.name + '" src="' + product.image + '"></div>';
													}
													html += '	<div class="product-name">' + product.name ;
													if(show_description){
														html += '<p>' + product.extra_info + '</p>';
													}
													html += '</div>';
													if(show_price){
														if (product.special) {
															html += '	<div class="product-price"><span class="special">' + product.price + '</span><span class="price">' + product.special + '</span></div>';
														} else {
															html += '	<div class="product-price"><span class="price">' + product.price + '</span></div>';
														}
													}
													html += '<span style="clear:both"></span>';
													html += '</a>';
													html += '</li>';
													$('.live-search ul').append(html);
												});
											} else {
												var html = '';
												html += '<li style="text-align: center;height:10px;">';
												html +=	live_search.text_no_matches;
												html +=	'</li>';

												$('.live-search ul').html(html);
											}
											$('.live-search ul li').css('height',live_search.height);
											$('.live-search').css('display','block');
											return false;
										}
									});
								}
							},
							'select': function(product) {
								$(live_search.selector).val(product.name);
							}
						});

						$(document).bind( "mouseup touchend", function(e){
						  var container = $('.live-search');
						  if (!container.is(e.target) && container.has(e.target).length === 0)
						  {
						    container.hide();
						  }
						});
					});
				//--></script>
			<?php endif;?>
            

</body></html>