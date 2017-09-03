<div class="row">

	<div class="col-sm-12 text-center">
	    <h4 class="general_title"><?php echo $heading_title; ?></h4>

	</div>
	<div class="col-sm-12">
	<p class="text-justify">Trabajamos con los mejores para ofrecerte la calidad, cantidad y precio que buscas</p>
		
	</div>

</div>

<div class="row">

	<div class="col-sm-12">

		<div class="list-group" style="margin-bottom: 10px;"> 

			

			<?php foreach ($manufacturers as $manufacturer) { ?>
			  <?php if ($manufacturer['manufacturer_id'] == $manufacturer_id) { ?>
				  <a href="<?php echo $manufacturer['href']; ?>" class="list-group-item"><?php echo $manufacturer['name']; ?></a>
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
			  	<a href="<?php echo $manufacturer['href']; ?>" class="list-group-item"><?php echo $manufacturer['name']; ?></a>
			  <?php } ?>
			<?php } ?>

		</div>
		
	</div>
	
</div>



