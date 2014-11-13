<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content" class="static_page">
    <?php echo $content_top; ?>
	<div class="container">		
		<h3><?php echo $heading_title; ?><small class="pull-right"><a href="<?php echo $news_link;?>"><?php echo $text_link;?></a></small></h3> 
		<div class="row-fluid pull-right news-detail clear">	
		<?php if ($description) { ?>
		  <?php } ?>
		</div>
		<?php // echo $text_content; ?>
		<h5><strong class="clearfix"><?php echo $date_added; ?></strong></h5>
		<div class="container col-xs-12 col-sm-12 col-md-12">
			<?php echo ($gallery) ? $gallery : ''; ?>
			<?php echo ($videos) ? $videos : ''; ?>			
			<?php echo $description; ?>
		</div>
			<div class="row-fluid news-detail clear">	
			<?php if ($description) { ?>
				<div class="share center-block"><!-- AddThis Button BEGIN -->
				  <div class="addthis_default_style addthis_32x32_style">
					  <!--a class="addthis_button_compact"><?php echo $text_share; ?></a-->
					  <!--a class="addthis_button_email"></a-->
					  <!--a class="addthis_button_print"></a-->
					  <a class="addthis_button_facebook"></a>
					  <a class="addthis_button_twitter"></a>
					  <a class="addthis_button_pinterest_share"></a>
				  </div>
				  <script type="text/javascript" src="//s7.addthis.com/js/250/addthis_widget.js"></script> 
				  <!-- AddThis Button END --> 
				</div>
			  <?php } ?>
			</div>
	</div>
    <?php echo $content_bottom; ?>
</div>
<?php echo $footer; ?>