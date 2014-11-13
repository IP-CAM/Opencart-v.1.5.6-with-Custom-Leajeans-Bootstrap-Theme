<?php echo $header; ?>
<?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content" class="content-home">
<?php echo $content_top; ?>
</div>
<h1 style="display: none;"><?php echo $heading_title; ?></h1>
<div class="container form">
	<div class="search col-xs-12 col-sm-6 col-md-7 visible-sm visible-md visible-lg">
	  <form role="form" id="search" action="<?php echo $search_page;?>">
		<div class="form-group">
			<label for="exampleInputEmail1" class="hidden">Search</label>
			<div class="input-group">
			<input type="search" class="form-control input-search" name="search" id="searchForm" placeholder="Search...">
				<span class="input-group-btn s-btn">
				  <button class="btn btn-default button-search" type="button">Go!</button>
				</span>
			</div><!-- /input-group -->
		</div>
	  </form>
	</div>
	<div class="newsletter col-xs-12 col-sm-6 col-md-offset-1 visible-sm visible-md visible-lg">
	<form role="form" class="form-horizontal" type="post" id="subscribe" name="subscribe">
		<div class="form-group">			
			<div class="col-xs-8">
				<label for="subscribe" class="hidden">Email address</label>
				<input type="hidden" id="subscribe_name" name="subscribe_name" value="-">
				<input type="email" class="form-control input-sm" name="subscribe_email" id="subscribe_email"  placeholder="Enter email....">
				<div class="center clearfix small" id="subscribe_result"></div>
			</div>			
			<div class="col-xs-8">
				<input type="submit" class="btn btn-block btn-default" id="submit-suscribe" name="submit-suscribe" value="Subscribe">
			</div>	
		</div>		   
	  </form>
	</div>
  </div>
<script language="javascript">
$('#subscribe').on('submit',function() {
	$.ajax({
			type: 'post',
			url: 'index.php?route=module/newslettersubscribe/subscribe',
			dataType: 'html',
			data:$("#subscribe").serialize(),
			success: function (html) {
				eval(html);
			}});
	 return false;
});
</script>
<div class="clear"></div>

<?php echo $content_bottom; ?>
<?php echo $footer; ?>