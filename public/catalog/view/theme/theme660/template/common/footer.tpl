<footer>    
    <div class="container">
        <div class="row">
            <div class="col-xs-6 col-sm-3">
                <?php if ($informations) { ?>
                    <div class="footer_box">
                        <h5><?php echo $text_information; ?></h5>
                        <ul class="list-unstyled">
                            <?php foreach ($informations as $information) { ?>
                                <li>
                                    <a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a>
                                </li>
                            <?php } ?>
							<li>
								<a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a>
							</li>
                        </ul>
                    </div>
                <?php } ?>
            </div>
			
            <div class="col-xs-6 col-sm-3">
				<div class="footer_box category-block"> </div>
            </div>
            
            <div class="col-xs-6 col-sm-3">
                <div class="footer_box">
                    <h5><?php echo $text_account; ?></h5>
                    <ul class="list-unstyled">
                        <li>
                            <a href="<?php echo $account; ?>"><?php echo $text_account; ?></a>
                        </li>
                        <li>
                            <a href="<?php echo $order; ?>"><?php echo $text_order; ?></a>
                        </li>
                        <li>
                            <a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a>
                        </li>                       
                    </ul>
                </div>
            </div>
            <div class="col-xs-6 col-sm-3">				
                <div class="footer_box">
					<h5><?php echo $text_contact; ?></h5>
					<ul class="list-unstyled contact-block">					
					<li><i class="fa fa-map-marker"></i><p>
					<?php if ($geocode) { ?>
						<a href="//maps.google.com/maps?ll=<?php echo str_replace(" ","",$geocode); ?>&z=14&t=m&hl=en-US&gl=US&mapclient=apiv3" target="_blank"><?php echo $address; ?> </a> 
					<?php } else { 
						?> <?php echo $address; ?><?php 
					} ?>
					</p></li>
					<li><i class="fa fa-phone"></i><a href="tel:<?php echo $telephone; ?>"><?php echo $telephone; ?></a></li>
					<li><i class="fa fa-envelope-o"></i><a href="mailto:<?php echo $email; ?>" ><?php echo $email; ?></a></li>
					</ul>
                    <div class="social-block"> </div>
                </div>
            </div>
        </div>
	
	<?php if ($footer_top) { ?>
        <div class="footer">
                <?php echo $footer_top; ?>
        </div>
    <?php } ?>
	
    </div>
	<?php if ($bottom) { ?>
		<section class="bottom"><?php echo $bottom; ?></section>
	<?php } ?>
    <div class="copyright">
        <div class="container">
            <?php echo $powered; ?><!-- [[%FOOTER_LINK]] -->
        </div>
    </div>
</footer>
<script src="catalog/view/theme/<?php echo $theme_path; ?>/js/livesearch.min.js" type="text/javascript"></script>
<script src="catalog/view/theme/<?php echo $theme_path; ?>/js/script.js" type="text/javascript"></script>
</div>

<div class="ajax-overlay"></div>

</body></html>