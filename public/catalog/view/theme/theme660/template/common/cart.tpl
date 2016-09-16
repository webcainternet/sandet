<div class="box-cart">
	<div id="cart" class="cart toggle-wrap">
		<button type="button" data-loading-text="<?php echo $text_loading; ?>" class="toggle">
			<i class="fa fa-shopping-cart"></i>
			<strong><?php echo $text_shopping_cart; ?></strong>
			<span id="cart-total" class="cart-total"><?php echo $text_items; ?></span>
			<?php if (isset($text_items2)) { ?>
				<span id="cart-total2" class="cart-total2"><?php echo $text_items2; ?></span>
			<?php } ?>
		</button>
			
		<ul class="pull-right toggle_cont">
			<?php if ($products || $vouchers) { ?>
			<li>
				<table class="table">
					<?php foreach ($products as $product) { ?>
					<tr>
						<td class="text-center"><?php if ($product['thumb']) { ?>
							<div class="image">
								<a href="<?php echo $product['href']; ?>">
									<img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" />
								</a>
							</div>
							<?php } ?>
						</td>
						<td class="text-left">
							<div class="name">
								<a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
							</div>							
							<div> x <?php echo $product['quantity']; ?> <span class="price-cart"><?php echo $product['total']; ?></span></div>
						</td>
						<td class="text-right"></td>
						<td class="text-center">
							<button type="button" onclick="cart.remove('<?php echo $product['cart_id']; ?>');" title="<?php echo $button_remove; ?>" class="btn btn-danger btn-xs">
								<i class="fa fa-times"></i>
							</button>
						</td>
					</tr>
					<?php } ?>
					<?php foreach ($vouchers as $voucher) { ?>
					<tr>
						<td class="text-center"><?php echo $voucher['description']; ?></td>
						<td class="text-left">x&nbsp;1&nbsp;<?php echo $voucher['amount']; ?></td>
						<td class="text-right text-danger">
							<button type="button" onclick="voucher.remove('<?php echo $voucher['key']; ?>');" title="<?php echo $button_remove; ?>" class="btn btn-danger btn-xs">
								<i class="fa fa-times"></i>
							</button>
						</td>
					</tr>
					<?php } ?>
				</table>
			</li>
			<li>
				<table class="table total">
					<?php foreach ($totals as $total) { ?>
					<tr>
						<td class="text-right">
							<strong><?php echo $total['title']; ?></strong>
						</td>
						<td class="text-right">
							<?php echo $total['text']; ?>
						</td>
					</tr>
					<?php } ?>
				</table>
				<div class="text-right">
					<a class="btn" href="<?php echo $cart; ?>"><span><?php echo $text_cart; ?></span></a>
					<a class="btn-primary" href="<?php echo $checkout; ?>"><span><?php echo $text_checkout; ?></span></a>
				</div>
			</li>
			<?php } else { ?>
			<li>
				<p class="text-center"><?php echo $text_empty; ?></p>
			</li>
			<?php } ?>
		</ul>
	</div>
</div>
