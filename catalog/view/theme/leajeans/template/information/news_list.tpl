<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div class="container">
  <div id="content" class="col-md-10" style="padding-top:50px;">
     <?php echo $content_top; ?>    
     <h1 class="hidden"><?php echo $heading_title; ?></h1>
     <div id="entry-listing" class="group">      	   
           <?php foreach ($all_news as $news) { ?>
  	    <div class="entry box isotope-item row-fluid">
  			<?php if ($news['cover']) { ?>
  	             <?php echo $news['cover']; ?>
  			<?php } ?>
  		   <div class="news-content">
  		       <a href="<?php echo $news['view'];?>" title="<?php echo $news['title']; ?>">
  		       <h3><?php echo $news['title']; ?></h3>
  		       </a>
  		       <div class="content-news"> 
  			       <?php echo $news['description']; ?>
  		       </div>	
  			   <span class="button_read">
  			   <a class="pull-right" href="<?php echo $news['view'];?>" title="<?php echo $news['title']; ?>">&raquo; Read More</a>
  			   </span>
  	       </div>
  	    </div>   
           <?php } ?>
     </div>         
     <div class="pagination"><?php echo $pagination; ?></div>      
     <?php echo $content_bottom; ?>
  </div>
  <div id="twitter_box" class="col-md-2 pull-left">
    <a class="twitter-timeline" href="https://twitter.com/leajeans" data-widget-id="450394922558836736">Tweets by @leajeans</a>
    <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
  </div>
</div>
<script type="text/javascript">
jQuery.ias({
    container   : "#entry-listing",
    item        : ".entry",
    pagination  : ".pagination",
    next        : ".ias_next",
    loader		: '<div class="fixed_bottom"><img src="catalog/view/javascript/images/ajax-loader.gif"/></div>',
	delay		: 1000,
  history   : false,
	//debug : true,
	//dataType : 'html',
	//maxPage : 1,*
    onRenderComplete: function(items) {
      var $newElems = jQuery(items).addClass("newItem");

      $newElems.hide().imagesLoaded(function(){
        /*
		if( jQuery(".flexslider").length > 0) {
          jQuery(".flexslider").flexslider({
            'controlNav': true,
            'directionNav': true
          });
        }*/
        jQuery(this).show();
        jQuery('#infscr-loading').fadeOut('normal');
        jQuery("#entry-listing").isotope('appended', $newElems );
        //loadAudioPlayer();
      });
    }
    });
</script>
<?php echo $footer; ?>

