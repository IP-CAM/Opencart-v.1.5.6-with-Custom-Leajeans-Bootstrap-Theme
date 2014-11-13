<div id="myCarousel<?php echo $module; ?>" class="carousel-top slide" data-ride="carousel">	
	<div class="carousel-inner" style="width: <?php //echo $width; ?>px; height: <?php //echo $height; ?>px;">				  
	  <?php 
	  $i=0;
	  foreach ($banners as $banner) { 
	  ?>			
	  <div class="item <?php echo ($i === 0) ? 'active' : '' ;?>">			
	  <?php if ($banner['link']) { ?>
		  <a href="<?php echo $banner['link']; ?>">
			  <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
	  <?php } else { ?>
		  <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
	  <?php } ?>
	  <?php if ($banner['title']) { ?>
		  <div class="row-fluid">
			  <div class="carousel-caption">
				  <h1><?php echo $banner['title']; ?></h1>
			  </div>
		  </div>
	  <?php } ?>			
	  </div><!-- /.carousel -->
	  <?php 
	  $i++;
	  } 
	  ?>	
	  </div>
		<!--div class="frame-slider">
			<img src="catalog/view/theme/leajeans/image/img/bg-slider-frame.png" class="img-responsive"/>
		</div-->
		<div class="prev-next-holder">
			<a class="left carousel-control" href="#myCarousel<?php echo $module; ?>" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span></a>
			<a class="right carousel-control" href="#myCarousel<?php echo $module; ?>" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right"></span></a>
		</div>
  </div>	
