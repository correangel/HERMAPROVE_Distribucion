<?php if ($show_title) { ?>

<h4 class="text-center blog_title"><?php echo $heading_title; ?></h4>
<?php } ?>
<div class="row tltblog">
<div class="col-sm-offset-1 col-sm-10 col-xs-12">
  <?php $class_cols = 'col-lg-' . 12 / $num_columns . ' col-md-' . 12 / $num_columns . ' col-sm-12 col-xs-12'; ?>
  <?php $rowcounter = 0; ?>
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
                    <?php if ($tltblog['show_description']) { ?>
                        <a href="<?php echo $tltblog['href']; ?>"><img src="<?php echo $tltblog['thumb']; ?>" alt="<?php echo $tltblog['title']; ?>" title="<?php echo $tltblog['title']; ?>" class="img-responsive" /></a>
                    <?php } else { ?>
                        <a><img src="<?php echo $tltblog['thumb']; ?>" alt="<?php echo $tltblog['title']; ?>" title="<?php echo $tltblog['title']; ?>" class="img-responsive" /></a>
                    <?php } ?>
                </div>
                <div class="col-xs-12">
                   <?php if ( $tltblog['show_description']) { ?>                        
                      
                  <?php } else { ?>
                      <h4><a><?php echo $tltblog['title']; ?></a></h4>
                  <?php } ?>
                  <div class="blogHome_intro"><?php echo $tltblog['intro']; ?></div>
                  <a href="<?php echo $tltblog['href']; ?>" class="pull-right"> Leer más</a>                    
                </div>
            <?php } else { ?>
                <div class="col-xs-12">
                    <?php if ($tltblog['show_description']) { ?>
                        <h4><a href="<?php echo $tltblog['href']; ?>"><?php echo $tltblog['title']; ?></a></h4>
                    <?php } else { ?>
                        <h4><a><?php echo $tltblog['title']; ?></a></h4>
                    <?php } ?>
                    <div class="blogHome_intro"><?php echo $tltblog['intro']; ?></div>
                    <a href="<?php echo $tltblog['href']; ?>" class="pull-right"> Leer más</a>
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
