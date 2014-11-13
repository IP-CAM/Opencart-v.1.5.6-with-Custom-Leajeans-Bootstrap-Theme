<div class="col-xs-12 col-sm-4 col-md-4 pull-right" id="featured">
  <div class="box-heading hidden"><?php echo $heading_title; ?></div>
  <div class="box-content">
    <div class="box-product">	
		<div id="myCarousel_bot" class="carousel-bot slide" data-ride="carousel">
			<!-- Wrapper for slides -->
			<div class="carousel-inner">
			<?php 
			$i=0;
			foreach ($products as $product) { 
			?>
			  <div class="item <?php echo ($i === 0) ? 'active' : '' ;?>">
				<?php if ($product['thumb']) { ?>
				<div class="fill">
					<div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
				</div>        
				<?php } ?>
				<div class="carousel-caption">
					<div class="name">
						<a href="<?php echo $product['href']; ?>">
							<h3><?php echo $product['name']; ?></h3>					
						</a>
					</div>
				</div>        
					<div class="display-button">
						<?php if ($product['price']) { ?>
						<div class="price">
						  <?php if (!$product['special']) { ?>
						  <?php echo $product['price']; ?>
						  <?php } else { ?>
						  <span class="price-old">
							  <?php echo $product['price']; ?></span>
							<span class="price-new"><?php echo $product['special']; ?>
						  </span>
						  <?php } ?>
						</div>
						<?php } ?>
						<?php if ($product['rating']) { ?>
						<div class="rating"><img src="catalog/view/theme/default/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
						<?php } ?>
						<div class="cart"><input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="btn btn-danger" /></div>
					</div>
				</div>
			  
			  <?php 
			  $i++;
			  } 
			  ?>
			 </div> 
			<!-- Controls -->
			<a class="left carousel-control" href="#myCarousel_bot" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</a>
			<a class="right carousel-control" href="#myCarousel_bot" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right"></span>
			</a>
		</div>		
   </div>
  </div>
</div>
</div>
