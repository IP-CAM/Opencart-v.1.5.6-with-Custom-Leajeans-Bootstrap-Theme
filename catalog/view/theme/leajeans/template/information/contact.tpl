<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content" class="container"><?php echo $content_top; ?>
  <h1 class="hidden"><?php echo $heading_title; ?></h1>
  <!--form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
    <h2><?php echo $text_location; ?></h2>
    <div class="contact-info">
      <div class="content"><div class="left"><b><?php echo $text_address; ?></b><br />
        <?php echo $store; ?><br />
        <?php echo $address; ?></div>
      <div class="right">
        <?php if ($telephone) { ?>
        <b><?php echo $text_telephone; ?></b><br />
        <?php echo $telephone; ?><br />
        <br />
        <?php } ?>
        <?php if ($fax) { ?>
        <b><?php echo $text_fax; ?></b><br />
        <?php echo $fax; ?>
        <?php } ?>
      </div>
    </div>
    </div>
    <h2><?php echo $text_contact; ?></h2>
    <div class="content">
    <b><?php echo $entry_name; ?></b><br />
    <input type="text" name="name" value="<?php echo $name; ?>" />
    <br />
    <?php if ($error_name) { ?>
    <span class="error"><?php echo $error_name; ?></span>
    <?php } ?>
    <br />
    <b><?php echo $entry_email; ?></b><br />
    <input type="text" name="email" value="<?php echo $email; ?>" />
    <br />
    <?php if ($error_email) { ?>
    <span class="error"><?php echo $error_email; ?></span>
    <?php } ?>
    <br />
    <b><?php echo $entry_enquiry; ?></b><br />
    <textarea name="enquiry" cols="40" rows="10" style="width: 99%;"><?php echo $enquiry; ?></textarea>
    <br />
    <?php if ($error_enquiry) { ?>
    <span class="error"><?php echo $error_enquiry; ?></span>
    <?php } ?>
    <br />
    <b><?php echo $entry_captcha; ?></b><br />
    <input type="text" name="captcha" value="<?php echo $captcha; ?>" />
    <br />
    <img src="index.php?route=information/contact/captcha" alt="" />
    <?php if ($error_captcha) { ?>
    <span class="error"><?php echo $error_captcha; ?></span>
    <?php } ?>
    </div>
    <div class="buttons">
      <div class="right"><input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-danger" /></div>
    </div>
  </form-->
  
   <div class="content-inside">
        <div class="col-md-4">
          <h4><b><?php echo $text_address; ?></b></h4>
          <p>
			<?php echo $address; ?>
          </p>
        </div>
        <div class="col-md-6">
		<?php if ($telephone) { ?>
          <h4><b><?php echo $text_telephone; ?></b></h4>
          <p>			
			<!--b><?php echo $text_telephone; ?></b><br /-->
			<?php echo '+'.$telephone; ?><br />
			<br />
			<?php } ?>
			<?php if ($fax) { ?>
			<b><?php echo $text_fax; ?></b><br />
			<?php echo $fax; ?>
          </p>
		<?php } ?>	
        </div>
        <div class="maps">
          <iframe src="https://www.google.com/maps/embed?pb=!1m16!1m12!1m3!1d7932.278107313261!2d106.79127539999999!3d-6.245399449999996!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!2m1!1sLEA+Jeans%2C+Kramat+Pela%2C+Jakarta%2C+Indonesia!5e0!3m2!1sen!2s!4v1395733297221" width="100%" height="600" frameborder="0" style="border:0"></iframe>
        </div>
   </div>
  
  <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>

