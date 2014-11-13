<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
	<div class="container" id="information">
		<h2 class="hidden"><?php echo $heading_title; ?></h2>
		<?php echo $description; ?>
		</div>
 </div>
  <?php echo $content_bottom; ?>
<script type="text/javascript">
$(document).ready(function() {
  var bodyHeight = $("body").height();
  var vwptHeight = $(window).height();
  if (vwptHeight > bodyHeight) {
    $("#footer").css("position","absolute").css("bottom",0);
    $("#gmap").css("position","absolute !important").css("bottom",'0 !important');
  }
});
</script> 
<?php echo $footer; ?>
