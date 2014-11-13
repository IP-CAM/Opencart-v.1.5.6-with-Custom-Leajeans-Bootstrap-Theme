<div class="box">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content">
    <ul>
      <?php foreach ($all_storelocator as $storelocator) { ?>
      <li><a href="<?php echo $storelocator['href']; ?>"><?php echo $storelocator['title']; ?></a></li>
      <?php } ?>
      <!--li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li-->
      <!--li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li-->
    </ul>
  </div>
</div>
