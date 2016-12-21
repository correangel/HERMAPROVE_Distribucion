<?php echo $header; ?>

<script type="text/javascript" language="javascript">
      $(function() {
        $('.blog_card_intro').dotdotdot({
          after: 'a.readmore'
        });
        $('.blog_card_title').dotdotdot();
      });
</script>

<div class="container">
	<ul class="breadcrumb">
    	<?php foreach ($breadcrumbs as $breadcrumb) { ?>
    		<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    	<?php } ?>
  	</ul>
	<div class="row">
  <?php echo $column_left; ?>
    	<?php if ($column_left && $column_right) { ?>
    		<?php $class = 'col-sm-6'; ?>
    	<?php } elseif ($column_left || $column_right) { ?>
    		<?php $class = 'col-sm-9'; ?>
    	<?php } else { ?>
    		<?php $class = 'col-sm-12'; ?>
    	<?php } ?>
    	<div id="content" class="<?php echo $class; ?>">
    		<?php echo $content_top; ?>
      		<h3 class="blog_title"><?php echo $heading_title; ?></h3>
          <hr>
            <div class="row tltblog">
              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <?php $rowcounter = 0; ?>
                <?php $class_cols = 'col-lg-' . 12 / $num_columns . ' col-md-' . 12 / $num_columns . 'col-sm-12 col-xs-12'; ?>
                <?php $sizetltblog = sizeof($tltblogs); ?>

                <div class="row tltblog">
                <?php foreach ($tltblogs as $tltblog) { ?>
                    <div class="<?php echo $class_cols; ?>">
                      <div class="row blogHome_card" style="height: 180px">
                          <?php if ($show_image) { ?>
                              <div class="col-sm-3 col-xs-3">
                              <?php if ($tltblog['show_description']) { ?>
                                  <a href="<?php echo $tltblog['href']; ?>"><img src="<?php echo $tltblog['thumb']; ?>" alt="<?php echo $tltblog['title']; ?>" title="<?php echo $tltblog['title']; ?>" class="img-thumbnail"/></a>
                              <?php } else { ?>
                                  <a><img src="<?php echo $tltblog['thumb']; ?>" alt="<?php echo $tltblog['title']; ?>" title="<?php echo $tltblog['title']; ?>" class="img-thumbnail"/></a>
                              <?php } ?>
                              </div>
                              <div class="col-sm-9" style="padding: 0">
                              <?php if ($tltblog['show_description']) { ?>
                                  <h4 class="blog_card_title"><a  title="<?php echo $tltblog['title']; ?>" href="<?php echo $tltblog['href']; ?>"><?php echo $tltblog['title']; ?></a></h4>
                              <?php } else { ?>
                                  <h4 class="blog_card_title"><a title="<?php echo $tltblog['title']; ?>"><?php echo $tltblog['title']; ?></a></h4>
                              <?php } ?>
                                  <div class="box blog_card_intro" ><?php echo $tltblog['intro']; ?><a href="<?php echo $tltblog['href']; ?>" class="readmore">Leer m&aacute;s &raquo;</a></div>
                              </div>
                          <?php } else { ?>
                              <div class="col-sm-12">
                              <?php if ($tltblog['show_description']) { ?>
                                  <h4><a href="<?php echo $tltblog['href']; ?>"><?php echo $tltblog['title']; ?></a></h4>
                              <?php } else { ?>
                                  <h4><a ><?php echo $tltblog['title']; ?></a></h4>
                              <?php } ?>
                                  <div id="blog_card_intro" class="box"><?php echo $tltblog['intro']; ?><a href="<?php echo $tltblog['href']; ?>" class="readmore">Leer m&aacute;s &raquo;</a></div>
                              </div>
                          <?php } ?>
                      </div>
                    </div>
                    <?php $rowcounter++; ?>
                    <?php if (($rowcounter == $num_columns) && $sizetltblog>3 ) { ?>
                    	</div>
                    	<div class="row tltblog">
                    	<?php $rowcounter = 0; ?>
                    <?php } ?>
                <?php } ?>
                </div>
              </div>
            </div>
      		<?php echo $content_bottom; ?>
    	</div>
    	<?php echo $column_right; ?>
	</div>
</div>
<?php echo $footer; ?>
