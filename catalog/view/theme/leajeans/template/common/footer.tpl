</div>
<div id="footer" class="footer"> 
	<div class="container-fluid">
		<div class="info-link">
			<div class="bottom-link col-xs-6 col-sm-3">
			  <h3><?php echo $text_service; ?></h3>
			  <ul class="list-group">
				<li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
				<!--li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li-->
				<!--li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li-->
			  </ul>
			</div>

			<?php if ($informations) { ?>
			<div class="bottom-link col-xs-6 col-sm-3">
			  <h3><?php echo $text_information; ?></h3>
			  <ul class="list-group">
				<?php foreach ($informations as $information) { ?>
				<li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
				<?php } ?>
			  </ul>
			</div>
			<?php } ?>

			<div class="bottom-link col-xs-6 col-sm-3">
				<h3><?php echo $text_finduson; ?></h3>
				<ul class="socials-footer">
					<li>
						<a class="fa fa-facebook-square fa-2x" href="https://www.facebook.com/jeanslea" title="Lea Jeans on Facebook">
							<span ></span>
						</a>
					</li>
					<li>
						<a class="fa fa-twitter-square fa-2x" href="https://twitter.com/leajeans" title="Lea Jeans on Twitter">
							<span ></span>
						</a>
					</li>
					<li>	<!-- href="https://youtube.com/user/leajeans" --> 
						<a class="fa fa-youtube fa-2x" href="#" title="Lea Jeans on Youtube">
							<span ></span>
						</a>
					</li>
					<li>	<!-- href="https://youtube.com/user/leajeans" --> 
						<a class="fa fa-instagram fa-2x" target="_blank" href="https://instagram.com/lea_jeans" title="Lea Jeans on Instagram">
							<span ></span>
						</a>
					</li>
				</ul>	
			</div>
		</div>	
	</div>	
</div>
<div id="powered" class="container"><?php echo $powered; ?></div>
<div id="topcontrol" title="Scroll Back to Top">
	<img style="width:40px; height:40px" src="catalog/view/theme/leajeans/image/up.png">
</div>
</body></html>