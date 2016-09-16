<?php if (empty($show)) { ?>
    <div id="tm-newsletter-popup" class="newsletter-popup-wrap">
        <div class="newsletter-popup" <?php if (isset($popup_bg)) { ?> style="background-image: url(<?php echo $popup_bg;?>)"<?php }?>>

            <div class="box-content">
                
                <h2><?php echo $heading_title; ?></h2>

                <p><?php echo $html; ?></p>

                <form method="post" enctype="multipart/form-data" id="tm-newsletter-popup-form">
                    <div class="tm-login-form">
                        <label class="control-label" for="input-tm-newsletter-popup-email"></label>
                        <input type="text" name="tm_newsletter_popup_email" value="<?php if ($user_mail) {
                            echo $user_mail;
                        } else {
                            echo '';
                        }; ?>" placeholder=""
                               id="input-tm-newsletter-popup-email" class="form-control"/>
						<button type="submit" id="tm-newsletter-popup-button" class="newsletter-popup-btn btn-primary"><i class="material-design-drafts"></i><?php echo $button_subscribe; ?></button>                        
                        <span id="tm-newsletter-popup_success" class="newsletter-success"></span>
						<span id="tm-newsletter-popup_error" class="newsletter-error"></span>
                    </div>

                </form>

            </div>
            <a href="#" id="newsletter-popup-close-btn" class="newsletter-popup-close-btn fa fa-times"></a>
            <a href='#' id="newsletter-popup-dont-show" class="newsletter-popup-dont-show"> <?php echo $text_dont;?>  </a>
        </div>
    </div>

<script>
	function getCookie(c_name) {
		var search = c_name + "="
		var returnvalue = "";
		if (document.cookie.length > 0) {
			offset = document.cookie.indexOf(search)
			if (offset != -1) {
				offset += search.length
				end = document.cookie.indexOf(";", offset);
				if (end == -1) end = document.cookie.length;
				returnvalue=unescape(document.cookie.substring(offset, end))
			}
		}
		return returnvalue;
	}
	jQuery(document).ready(function ($) {
		var showIt = getCookie('shownewsletter');
		var m = <?php echo $cookie_time?>;
		var date = new Date();
		date.setTime(date.getTime() + (m * 60 * 1000));
		if (showIt == '') {
			$('#tm-newsletter-popup').fadeIn(300);
		}
		$('#newsletter-popup-dont-show').click(function (e) {
			e.preventDefault()
			document.cookie = 'shownewsletter=true; path=/; expires=' + date.toString();
			$('#tm-newsletter-popup').fadeOut(300);
		});
		$('#newsletter-popup-close-btn').click(function (e) {
			e.preventDefault();
			document.cookie = 'shownewsletter=false';
			$('#tm-newsletter-popup').fadeOut(300);
		});
		$('#tm-newsletter-popup').submit(function (e) {
			e.preventDefault();
			var email = $("#input-tm-newsletter-popup-email").val();
			var emailRegex = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+.[A-Z]{2,4}$/igm;
			if (emailRegex.test(email)) {
				var dataString = 'tm_newsletter_popup_email=' + email;
				$.ajax({
					type: "POST",
					url: "index.php?route=module/tm_newsletter_popup",
					data: dataString,
					cache: false,
					success: function (result) {
						if (!result) {
							$('#tm-newsletter-popup_error').html('');
							$('#tm-newsletter-popup_success').stop(true, true).html('<?php echo $success; ?>').fadeIn(300).delay(4000).fadeOut(300);
						} else {
							$('#tm-newsletter-popup_success').html('');
							$('#tm-newsletter-popup_error').stop(true, true).html(result).fadeIn(300).delay(4000).fadeOut(300);
						}
					}
				});
			} else {
				$('#tm-newsletter-popup_success').html('');
				$('#tm-newsletter-popup_error').stop(true, true).html('<?php echo $error_invalid_email; ?>').fadeIn(300).delay(4000).fadeOut(300);
			}
		});
});
</script>

<?php } ?>