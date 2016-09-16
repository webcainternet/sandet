
<ul class="social-list list-unstyled">
    
    <?php if ($youtube) { ?>
        <li>
            <a href='<?php echo $youtube;?>'>
                <i class="fa fa-youtube" data-toggle="tooltip" title="<?php echo $text_youtube; ?>"></i>
            </a>
        </li>
    <?php }?>
	<?php if ($facebook) {?>
         <li>
            <a href='<?php echo $facebook;?>'>
				<i class="fa fa-facebook" data-toggle="tooltip" title="<?php echo $text_facebook; ?>"></i>
            </a>
        </li>
    <?php }?>
	 <?php if ($twitter) {?>
       <li>
            <a href='<?php echo $twitter;?>'>
				<i class="fa fa-twitter" data-toggle="tooltip" title="<?php echo $text_twitter; ?>"></i>
            </a>
        </li>
    <?php }?>   
	
    <?php if ($pinterest) {?>
       <li>
            <a href='<?php echo $pinterest;?>'>
				<i class="fa fa-pinterest" data-toggle="tooltip" title="<?php echo $text_pinterest; ?>"></i>
            </a>
        </li>
    <?php }?>
    <?php if ($instagram) {?>
        <li>
            <a href='<?php echo $instagram;?>'>
				<i class="fa fa-instagram" data-toggle="tooltip" title="<?php echo $text_instagram; ?>"></i>
            </a>
        </li>
    <?php }?>
	 <?php if ($google_plus) { ?>
       <li>
            <a href='<?php echo $google_plus;?>'>
				<i class="fa fa-google-plus" data-toggle="tooltip" title="<?php echo $text_google_plus; ?>"></i>
            </a>
        </li>
    <?php }?>   
    <?php if ($vimeo) {?>
       <li>
            <a href='<?php echo $vimeo;?>'>
				<i class="fa fa-vimeo-square" data-toggle="tooltip" title="<?php echo $text_vimeo; ?>"></i>
            </a>
        </li>
    <?php }?>
</ul>