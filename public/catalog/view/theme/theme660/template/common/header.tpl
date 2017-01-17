<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]>
	<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8">
	<![endif]-->
<!--[if IE 9 ]>
	<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9">
	<![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
	<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
	<!--<![endif]-->	

	<head>
		<meta charset="UTF-8"/>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title><?php echo $title; ?></title>
		<base href="<?php echo $base; ?>"/>
		<?php if ($description) { ?>
		<meta name="description" content="<?php echo $description; ?>"/>
		<?php } ?>
		<?php if ($keywords) { ?>
		<meta name="keywords" content="<?php echo $keywords; ?>"/>
		<?php } ?>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<!--    --><?php //if ($icon) { ?>
		<!--        <link href="--><?php //echo $icon; ?><!--" rel="icon"/>-->
		<!--    --><?php //} ?>

		<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen"/>
		<link href="catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css" rel="stylesheet">
		<link href="catalog/view/javascript/jquery/owl-carousel/owl.carousel.css" rel="stylesheet">
		<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet">
		<!-- font -->
		<link href='//fonts.googleapis.com/css?family=PT+Serif:400,700&subset=latin,cyrillic' rel='stylesheet' type='text/css'>
		<link href='//fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
		<link href='//fonts.googleapis.com/css?family=Roboto:400,300&subset=latin,cyrillic' rel='stylesheet' type='text/css'>
		<!--    -->
		<link href="catalog/view/theme/<?php echo $theme_path; ?>/stylesheet/magnificent.css" rel="stylesheet">
		<link href="catalog/view/theme/<?php echo $theme_path; ?>/js/jquery.bxslider/jquery.bxslider.css" rel="stylesheet">
		<link href="catalog/view/theme/<?php echo $theme_path; ?>/stylesheet/photoswipe.css" rel="stylesheet">
		<link href="catalog/view/theme/<?php echo $theme_path; ?>/js/fancybox/jquery.fancybox.css" rel="stylesheet">
		<link href="catalog/view/theme/<?php echo $theme_path; ?>/stylesheet/material-design.css" rel="stylesheet">
		<link href="catalog/view/theme/<?php echo $theme_path; ?>/stylesheet/fl-line-icon-set.css" rel="stylesheet">
		
		<?php foreach ($links as $link) { ?>
		<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
		<?php } ?>

		<?php foreach ($styles as $style) { ?>
		<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>"
		media="<?php echo $style['media']; ?>"/>
		<?php } ?>
		<link href="catalog/view/theme/<?php echo $theme_path; ?>/stylesheet/stylesheet.css" rel="stylesheet">

		<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
		<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
		<script src="catalog/view/javascript/jquery/datetimepicker/moment.js" type="text/javascript"></script>
		<script src="catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
		<script src="catalog/view/theme/<?php echo $theme_path; ?>/js/common.js" type="text/javascript"></script>
		<script src="catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js" type="text/javascript"></script>
		<!--custom script-->
		<?php foreach ($scripts as $script) { ?>
		<?php if (strcmp($script, 'catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js') != 0) { ?>
		<script src="<?php echo $script; ?>" type="text/javascript"></script>
		<?php } ?>
		<?php } ?>

		<script src="catalog/view/theme/<?php echo $theme_path; ?>/js/device.min.js" type="text/javascript"></script>
		
		<!--[if lt IE 9]>
			<div style=' clear: both; text-align:center; position: relative;'>
				<a href="http://windows.microsoft.com/en-us/internet-explorer/download-ie">
					<img src="catalog/view/theme/<?php echo $theme_path; ?>/image/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today."/>
				</a>
			</div>
			<![endif]-->
			<?php foreach ($analytics as $analytic) { ?>
			<?php echo $analytic; ?>
			<?php } ?>
		</head>
		<body class="<?php echo $class; ?>">
			<p id="gl_path" class="hidden"><?php echo $theme_path; ?></p>
			<div id="page">
				<header>
					
					<div id="stuck"> 
					<div class="header__top"> 
						<div class="container">
							<div>
								<nav id="top-links" class="nav toggle-wrap">
									<a class="toggle fa fa-bars" href='#'></a>
									<div class="toggle_cont">
										<ul class="list-unstyled">
											<?php if ($logged) { ?>
											<li> <a href="<?php echo $account; ?>"><?php echo $text_account; ?></a> </li>
											<li> <a href="<?php echo $order; ?>"><?php echo $text_order; ?></a> </li>
											<li> <a href="<?php echo $wishlist; ?>"> <?php echo $text_wishlist1; ?> </a> </li>
											<li> <a href="/index.php?route=product/compare"> Lista de comparação </a> </li>
											<li> <a href="<?php echo $shopping_cart; ?>" > <?php echo $text_shopping_cart; ?> </a> </li>
											<li> <a href="<?php echo $checkout; ?>" > <?php echo $text_checkout; ?> </a> </li>
											<li> <a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a> </li>
											<?php } else { ?>										
											<li> <a href="<?php echo $login; ?>"><?php echo $text_login; ?></a> </li>
											<li> <a href="<?php echo $register; ?>"><?php echo $text_register; ?></a> </li>
											<li> <a href="<?php echo $wishlist; ?>"> <?php echo $text_wishlist1; ?> </a> </li>
											<li> <a href="/index.php?route=product/compare"> Lista de comparação </a> </li>
											<li> <a href="<?php echo $shopping_cart; ?>" > <?php echo $text_shopping_cart; ?> </a> </li>
											<li> <a href="<?php echo $checkout; ?>" > <?php echo $text_checkout; ?> </a> </li>
											<?php } ?>
										</ul>
										<ul class="list-unstyled">
											<?php echo $currency; ?>
											<?php echo $language; ?>
										</ul>										
									</div>
								</nav>
								
								<div id="logo" class="logo">
									<?php if ($logo) { ?>
									<a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive"/></a>
									<?php } else { ?>
									<h1> <a href="<?php echo $home; ?>"><?php echo $name; ?></a> </h1>
									<?php } ?>
								</div>								
								
							</div>
							
							<div class="pull-right">
								
								<?php if ($top) { ?> <div class="top"><?php echo $top; ?></div> <?php } ?>
								
								<span class="phone"><i class="fa fa-phone"></i><?php echo $telephone; ?></span>


								<div class="box-cart">
									<div id="cart" class="cart toggle-wrap">
										
										<button type="button" data-loading-text="<?php echo $text_loading; ?>" class="toggle">
											<a href="/index.php?route=account/wishlist">
												<i class="fa fa-heart"></i>
												<!--
												<strong>Lista de desejos</strong>
												<span id="cart-total2" class="cart-total2"><strong><?php echo $text_wishlist; ?></strong></span>
												-->
											</a>
										</button>
									</div>
								</div>
								
								<?php echo $cart; ?>
							</div>
							
						</div>
						
					</div>
					</div>
					
					<?php if ($header_top) { ?>
						<div class="header_modules"><?php echo $header_top; ?></div>
					<?php } ?>
						
					<div  class="stuck-menu">
						<div class="container">
						
							<?php if ($navigation){?>
								<div class="navigation"> <?php echo $navigation;?> </div>							
							<?php }?>
							
							<?php echo $search; ?>
							
						</div>
					</div>
					
				</header>
				

