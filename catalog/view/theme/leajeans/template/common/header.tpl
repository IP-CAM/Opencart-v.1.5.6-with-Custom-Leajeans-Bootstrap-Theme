<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/leajeans/stylesheet/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/leajeans/stylesheet/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="catalog/view/theme/leajeans/stylesheet/stylesheet.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/leajeans/stylesheet/style.css" />
<?php foreach ($styles as $style) { ?>
<link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script type="text/javascript" src="catalog/view/javascript/jquery/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/bootstrap-touchspin/bootstrap.touchspin.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" />
<?php foreach ($scripts as $script) { ?>
<script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>
<script type="text/javascript" src="catalog/view/javascript/back-to-top.js"></script>
<script type="text/javascript" src="catalog/view/javascript/common.js"></script>
<!--[if lt IE 9]><script src="catalog/view/javascript/html5shiv.js"></script><![endif]-->
<!--[if IE 7]> 
<link rel="stylesheet" type="text/css" href="catalog/view/theme/leajeans/stylesheet/ie7.css" />
<![endif]-->
<!--[if lt IE 7]>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/leajeans/stylesheet/ie6.css" />
<script type="text/javascript" src="catalog/view/javascript/DD_belatedPNG_0.0.8a-min.js"></script>
<script type="text/javascript">
DD_belatedPNG.fix('#logo img');
</script>
<![endif]-->
<?php if ($stores) { ?>
<script type="text/javascript"><!--
$(document).ready(function() {
<?php foreach ($stores as $store) { ?>
$('body').prepend('<iframe src="<?php echo $store; ?>" style="display: none;"></iframe>');
<?php } ?>
});
//--></script>
<?php } ?>
<?php echo $google_analytics; ?>
</head>
<body>
<div class="navbar navbar-inverse header" role="navigation">
	<div class="container">
		<?php if ($logo) { ?>
			<div id="logo" class="pull-left"><a href="<?php echo $home; ?>">
				<img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a>
			</div>
		<?php } ?>
		<div class="navbar-header">
		  <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse, .socials">
			<span class="sr-only">Toggle Menu</span>
			<span class="fa fa-bars fa-2x fa-inverse"></span>
		  </button>	
		  	<ul class="list-inline socials-top visible-xs pull-right">
				<li>
					<a target="_blank" href="https://www.facebook.com/jeanslea" title="Lea Jeans on Facebook">
						<img src="catalog/view/theme/leajeans/image/social_media_facebook.png" title="facebook" alt="facebook" />
					</a>
				</li>
				<li>
					<a target="_blank" href="https://twitter.com/leajeans" title="Lea Jeans on Twitter">
						<img src="catalog/view/theme/leajeans/image/social_media_twitter.png" title="Twitter" alt="Twitter" />
					</a>
				</li>
				<!--<li>
					<a href="#" title="Lea Jeans on YouTube">
						<img src="catalog/view/theme/leajeans/image/social_media_yotube.png" title="YouTube" alt="YouTube" />
					</a>
				</li>-->
				<li>
					<a target="_blank" href="https://instagram.com/lea_jeans" title="Lea Jeans on Instagram">
						<img src="catalog/view/theme/leajeans/image/social_media_instagram.png" title="instagram" alt="instagram" />
					</a>
				</li>
			</ul>	
		</div>
		<div class="collapse navbar-collapse">
			<ul class="nav navbar-nav navigate-leajeans">
				<li class="active"><a href="<?php echo $home; ?>"><?php echo $text_home; ?></a></li>
				<li><a href="<?php echo $shopping_cart; ?>"><?php echo $text_shopping_cart; ?></a></li>						
				<li><a href="<?php echo $store_locator; ?>"><?php echo $text_store_locator; ?></a></li>						
				<li><a href="<?php echo $news; ?>"><?php echo $text_news_event; ?></a></li>	
				<li><a href="<?php echo $story; ?>"><?php echo $text_story; ?></a></li>												
				<li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>						
			</ul>	
			<ul class="list-inline socials visible-lg visible-md pull-right">
				<li>
					<a target="_blank" href="https://www.facebook.com/jeanslea" title="Lea Jeans on Facebook">
						<img src="catalog/view/theme/leajeans/image/social_media_facebook.png" title="facebook" alt="facebook" />
					</a>
				</li>
				<li>
					<a target="_blank" href="https://twitter.com/leajeans" title="Lea Jeans on Twitter">
						<img src="catalog/view/theme/leajeans/image/social_media_twitter.png" title="Twitter" alt="Twitter" />
					</a>
				</li>
				<!--<li>
					<a href="#" title="Lea Jeans on YouTube">
						<img src="catalog/view/theme/leajeans/image/social_media_yotube.png" title="YouTube" alt="YouTube" />
					</a>
				</li>-->
				<li>
					<a target="_blank" href="https://instagram.com/lea_jeans" title="Lea Jeans on Instagram">
						<img src="catalog/view/theme/leajeans/image/social_media_instagram.png" title="instagram" alt="instagram" />
					</a>
				</li>
			</ul>	
		</div><!--/.nav-collapse -->
	</div>
</div>
<div id="container" class="container">
<?php if ($error) { ?>    
    <div class="warning"><?php echo $error ?><img src="catalog/view/theme/leajeans/image/close.png" alt="" class="close" /></div>    
<?php } ?>
<div id="notification"></div>
