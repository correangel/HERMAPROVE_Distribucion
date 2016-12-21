<?php echo $header; ?>
<div class="container">
    <div class="row">
            <?php echo $column_left; ?>

             
                    <?php if ($column_left && $column_right) { ?>
                        <?php $class = 'col-sm-5'; ?>
                    <?php } elseif ($column_left || $column_right) { ?>
                        <?php $class = 'col-sm-9'; ?>
                    <?php } else { ?>
                        <?php $class = 'col-sm-12'; ?>
                    <?php } ?>   

                <div id="content" class="<?php echo $class; ?>">

                    <div class="row">
                        <div class="col-sm-12">
                            <?php echo $content_top; ?>
                        </div>

                    </div>   
                </div>
            

         <?php echo $column_right; ?>

    </div>
</div>

<div id="blog">
    <div class="container" >
        <div class="row">
            <div class="col-sm-12"><?php echo $content_bottom; ?></div>
        </div>
    </div>
</div>



<?php echo $footer; ?>