<div class="panel panel-default">
  <div class="panel-heading"><?php echo $heading_title; ?></div>
  <div class="panel-body">

  	<ul style="list-style-type:none;padding-left: 10px;">
    <?php foreach ($manufacturers as $manufacturer) { ?>
	  <?php if ($manufacturer['manufacturer_id'] == $manufacturer_id) { ?>
		  <li><a href="<?php echo $manufacturer['href']; ?>" class="active"><?php echo $manufacturer['name']; ?></a></li>
		<?php if ($manufacturer['children']) { ?>
		  	<ul style="list-style-type:none;padding-left: 10px;">
		  	<?php foreach ($manufacturer['children'] as $child) { ?>
		  		<?php if ($child['manufacturer_id'] == $child_id) { ?>
		  			<li><a href="<?php echo $child['href']; ?>" class="active">&nbsp;&nbsp;&nbsp;- <?php echo $child['name']; ?></a></li>
		  		<?php } else { ?>
		  			<li><a href="<?php echo $child['href']; ?>" class="">&nbsp;&nbsp;&nbsp;- <?php echo $child['name']; ?></a></li>
		  		<?php } ?>
		  	<?php } ?>
		  	</ul>

		<?php } ?>
	  <?php } else { ?>
	  	<li><a href="<?php echo $manufacturer['href']; ?>" class=""><?php echo $manufacturer['name']; ?></a></li>
	  <?php } ?>
	<?php } ?>


	</ul> 
  </div>
</div>