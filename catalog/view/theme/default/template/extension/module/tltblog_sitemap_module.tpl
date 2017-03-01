<div class="row" id="blog_SiteMap">
    <div class="col-sm-12">
    <?php if ($show_path) { ?>
    <div class="row">
  <div class="col-sm-12 text-center">
    <h4 class="general_title"><?php echo $path_title; ?></h4>
  </div>
</div>

    <?php } ?>
    <?php if ($type == 'blogs') { ?>
        <ul>
            <?php foreach ($tltblogs as $tltblog) { ?>
                <li><a href="<?php echo $tltblog['href']; ?>"><?php echo $tltblog['title']; ?></a></li>
            <?php } ?>
        </ul>
    <?php } elseif ($type == 'tags') { ?>
        <ul>
            <?php foreach ($tlttags as $tlttag) { ?>
                <li><a href="<?php echo $tlttag['href']; ?>"><?php echo $tlttag['title']; ?></a></li>
            <?php } ?>
        </ul>
    <?php } else { ?>
        <div class="row">
            <div class="col-sm-12">
                <h5><?php echo $heading_blogs; ?></h5>
                <ul>
                    <?php foreach ($tltblogs as $tltblog) { ?>
                        <li><a href="<?php echo $tltblog['href']; ?>"><?php echo $tltblog['title']; ?></a></li>
                    <?php } ?>
                </ul>
            </div>
            <div class="col-sm-12">
        		<h5><?php echo $heading_tags; ?></h5>
                <ul>
                    <?php foreach ($tlttags as $tlttag) { ?>
                        <li><a href="<?php echo $tlttag['href']; ?>"><?php echo $tlttag['title']; ?></a></li>
                    <?php } ?>
                </ul>
        	</div>
        </div>
    <?php } ?>
    </div>
</div>