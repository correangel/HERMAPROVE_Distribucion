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
      		<div class="row">
            <div class="col-sm-12 text-center">
              <h4 class="general_title"><?php echo $heading_title; ?></h4>
            </div>
          </div>
            <div class="row tltblog">
              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <?php $rowcounter = 0; ?>
                <?php $class_cols = 'col-lg-' . 12 / $num_columns . ' col-md-' . 12 / $num_columns . 'col-sm-12 col-xs-12'; ?>
                <?php $sizetltblog = sizeof($tltblogs); ?>

                <div class="row tltblog">



                  <?php foreach ($tltblogs as $tltblog) { ?>
                    <div class="<?php echo $class_cols; ?>" >
                        <div class="row blogHome_card">
                          <?php if ($show_image) { ?>
                              <div class="col-xs-12" style=" text-align: justify;">
                                    <h4><a href="<?php echo $tltblog['href']; ?>" class="blogHome_cardTitle"><?php echo $tltblog['title']; ?></a></h4>
                                    <p>Por <?php echo $tltblog['show_author']; ?> el <?php echo $tltblog['created_at']; ?></p>
                              </div>
                              <div class="text-center col-xs-12">
                                      <a href="<?php echo $tltblog['href']; ?>"><img src="<?php echo $tltblog['thumb']; ?>" alt="<?php echo $tltblog['title']; ?>" title="<?php echo $tltblog['title']; ?>" class="img-responsive text-center" /></a>
                              </div>
                              <div class="col-xs-12">
                                <a href="<?php echo $tltblog['href']; ?>" class="pull-right"> Leer artículo...</a>
                              </div>
                          <?php } else { ?>
                              <div class="col-xs-12">
                                  <?php if ($tltblog['show_description']) { ?>
                                      <h4><a href="<?php echo $tltblog['href']; ?>"><?php echo $tltblog['title']; ?></a></h4>
                                  <?php } else { ?>
                                      <h4><a><?php echo $tltblog['title']; ?></a></h4>
                                  <?php } ?>
                                  <a href="<?php echo $tltblog['href']; ?>" class="pull-right"> Leer artículo...</a>
                              </div>
                          <?php } ?>
                        </div>
                    </div>
                    <?php $rowcounter++; ?>
                    <?php if ($rowcounter == $num_columns) { ?>
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
