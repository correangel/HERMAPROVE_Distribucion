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
          
          <!--<li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>-->
          <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
          <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
          
          <li><a href="">Promociones <i class="fa fa-star" aria-hidden="true" style="color:#efef00;background:#303030 "></i></a></li>
          <li><a href="<?php echo $blog[0]['href']; ?>"><?php echo $blog[0]['href']; ?></a></li>
        </ul>
      </div>
      <!--<div class="col-sm-3">
        <h5><?php echo $text_extra; ?></h5>
        <ul class="list-unstyled">
          <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
          <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
          <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
          <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
        </ul>
      </div>
      <div class="col-sm-3">
        <h5><?php echo $text_account; ?></h5>

        <ul class="list-unstyled">
          <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
          <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
          <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
          <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
        </ul>
      </div>-->
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

</body></html>