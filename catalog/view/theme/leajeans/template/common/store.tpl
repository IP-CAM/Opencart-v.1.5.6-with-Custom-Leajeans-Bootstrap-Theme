<?php echo $header; ?><?php // echo $column_left; ?><?php // echo $column_right; ?>
<div id="content"><?php // echo $content_top; ?>
<h1 style="display: none;"><?php echo $heading_title; ?></h1>
<?php echo // $content_bottom; ?>
<?php echo $footer; ?>
<script type="text/javascript">
$(document).ready(function() {
  var bodyHeight = $("body").height();
  var vwptHeight = $(window).height();
  if (vwptHeight > bodyHeight) {
    $("#footer").css("position","absolute").css("bottom",0);
  }
});
</script> 
