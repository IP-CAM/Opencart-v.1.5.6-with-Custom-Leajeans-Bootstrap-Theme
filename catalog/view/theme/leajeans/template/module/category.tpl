  <div class="head-box row-fluid hidden"><h4><?php echo $heading_title; ?></h4></div>
  	  <ul class="list-unstyled parent-tree">
      <?php foreach ($categories as $category) { ?>
      <li>
        <?php if ($category['category_id'] == $category_id) { ?>
		<div class="head-box hidden">
			<strong>
				<a href="<?php echo $category['href']; ?>" class="active"><?php echo $category['name']; ?></a>
			</strong>
		</div>
        <?php } else { ?>
        <!--div class="head-box">
			<strong>
			<a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></strong>
		</div-->	
        <?php } ?>
        <?php if ($category['children']) { ?>
        <ul class="list-unstyled children-tree">
          <?php foreach ($category['children'] as $child) { ?>
          <li>
			<?php if ($child['category_id'] == $child_id) { ?>
            <a href="<?php echo $child['href']; ?>" class="active">
				<?php if ($child['image']) { ?><img src="<?php echo $child['image'];?>" alt="<?php echo $category['name'];?>"><?php }?>
				<span class="clearfix"><?php echo $child['name']; ?></span>
			</a>
            <?php } else { ?>
            <a href="<?php echo $child['href']; ?>">
				<?php if ($child['image']) { ?><img src="<?php echo $child['image'];?>" alt="<?php echo $category['name'];?>"><?php }?>
				<span class="clearfix"><?php echo $child['name']; ?></span>
			</a>
            <?php } ?>
          </li>
          <?php } ?>
        </ul>
        <?php } ?>
      </li>
      <?php } ?>
    </ul>
