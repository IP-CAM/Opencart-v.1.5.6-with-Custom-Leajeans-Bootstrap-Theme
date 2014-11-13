<?php echo $header; ?>
<div class="container">
<div class="col-xs-3 pull-left">
	<?php echo $column_left; ?>
</div>
<div class="col-xs-8 pull-right">	
	<?php echo $column_right; ?>
</div>	
<div id="content" class="col-xs-12"><?php echo $content_top; ?>
  <div class="breadcrumb hidden">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <h1 class="hidden"><?php echo $heading_title; ?></h1>
  <div class="category-info hidden">  
  <?php if ($thumb || $description) { ?>
    <?php if ($thumb) { ?>
    <div class="image pull-left">
		<img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" />
	</div>	
    <?php } ?>
	<h3 class="head"><?php echo $heading_title; ?></h3>  
    <?php //if ($description) { ?>
    <?php //echo $description; ?>
    <?php //} ?>  
  <?php } ?>
  </div>
  <div class="pagination"><?php echo $pagination; ?></div>
  <?php if ($categories) { ?>
  <h2 class="hidden"><?php echo $text_refine; ?></h2>
  <div class="category-list hidden">
    <?php if (count($categories) <= 5) { ?>
    <ul>
      <?php foreach ($categories as $category) { ?>
      <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
      <?php } ?>
    </ul>
    <?php } else { ?>
    <?php for ($i = 0; $i < count($categories);) { ?>
    <ul>
      <?php $j = $i + ceil(count($categories) / 4); ?>
      <?php for (; $i < $j; $i++) { ?>
      <?php if (isset($categories[$i])) { ?>
      <li><a href="<?php echo $categories[$i]['href']; ?>"><?php echo $categories[$i]['name']; ?></a></li>
      <?php } ?>
      <?php } ?>
    </ul>
    <?php } ?>
    <?php } ?>
  </div>
  <?php } ?>
  <?php if ($products) { ?>
  <div class="product-filter hidden">
    <div class="display"><b><?php echo $text_display; ?></b> <?php echo $text_list; ?> <b>/</b> <a onclick="display('grid');"><?php echo $text_grid; ?></a></div>
    <div class="limit"><b><?php echo $text_limit; ?></b>
      <select onchange="location = this.value;">
        <?php foreach ($limits as $limits) { ?>
        <?php if ($limits['value'] == $limit) { ?>
        <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
        <?php } ?>
        <?php } ?>
      </select>
    </div>
    <div class="sort"><b><?php echo $text_sort; ?></b>
      <select onchange="location = this.value;">
        <?php foreach ($sorts as $sorts) { ?>
        <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
        <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
        <?php } ?>
        <?php } ?>
      </select>
    </div>
  </div>
  <!--div class="product-compare"><a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a></div-->
  <div class="row">
    <?php foreach ($products as $product) { ?>
	<div class="col-sm-6 col-md-3 shoplist">
		<div class="thumbnail">
			<?php if ($product['thumb']) { ?>
			<a href="<?php echo $product['href']; ?>">
			  <img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" />
			</a>
			<?php } ?>
		</div>
		<div class="caption">
		    <strong><?php echo $product['name']; ?></strong>
		    <div class="item-desc"><?php echo $product['description']; ?></div>
		    <a href="<?php echo $product['href']; ?>" class="btn btn-primary pull-right">Check</a>
		</div>
	</div>
    <?php } ?>
  </div>
  <?php } else { ?>
	<?php echo $text_empty; ?>&nbsp;
	<a href="<?php echo $continue; ?>" class=""><?php echo $button_continue; ?></a>
  <?php } ?>
  <?php if (!$categories && !$products) { ?>
  <div class="content hidden"><?php echo $text_empty; ?></div>
  <div class="buttons hidden">
    <div class="right"><a href="<?php echo $continue; ?>" class="btn btn-danger"><?php echo $button_continue; ?></a></div>
  </div>
  <?php } ?>
  <?php echo $content_bottom; ?></div>
</div>
<?php echo $footer; ?>