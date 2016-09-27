<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
	<?php foreach ($breadcrumbs as $breadcrumb) { ?>
	<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
	<?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
	<?php if ($column_left && $column_right) { ?>
	<?php $class = 'col-sm-6'; ?>
	<?php } elseif ($column_left || $column_right) { ?>
	<?php $class = 'col-sm-9'; ?>
	<?php } else { ?>
	<?php $class = 'col-sm-12'; ?>
	<?php } ?>
	<div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
	  <h2><?php echo $heading_title; ?></h2>
	  <?php if ($products) { ?>
          <div class="product-filter clearfix">
              <div class="product-filter_elem">
                  <div class="button-view">
                      <button type="button" id="list-view" data-toggle="tooltip" title="<?php echo $button_list; ?>"><i class="material-design-view12"></i></button>
                      <button type="button" id="grid-view" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="material-design-two375"></i></button>
                  </div>
              </div>
              <div class="product-filter_elem sort">
                  <label class="control-label" for="input-sort"><?php echo $text_sort; ?></label>
                  <select id="input-sort" class="form-control col-sm-3" onchange="location = this.value;">
                      <?php foreach ($sorts as $sorts) { ?>
                          <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                              <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
                          <?php } else { ?>
                              <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
                          <?php } ?>
                      <?php } ?>
                  </select>
              </div>
              <div class="product-filter_elem show pull-right">
                  <label class="control-label" for="input-limit"><?php echo $text_limit; ?></label>
                  <select id="input-limit" class="form-control" onchange="location = this.value;">
                      <?php foreach ($limits as $limits) { ?>
                          <?php if ($limits['value'] == $limit) { ?>
                              <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
                          <?php } else { ?>
                              <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
                          <?php } ?>
                      <?php } ?>
                  </select>
              </div>
              <div class="product-filter_elem">
                  <div class="button-view">
                      <a href="<?php echo $compare; ?>" id="compare-total" class="compare-total fa fa-exchange" data-toggle="tooltip" title="<?php echo $text_compare; ?>"><span id="compare-total-num"><?php echo $text_compare; ?></span>
                      </a>
                  </div>
              </div>


          </div>

	  <div class="row">  
		<?php $pr = 10000; foreach ($products as $product) { $pr++;?>
            <div class="product-layout product-list col-xs-12">
                <div class="product-thumb transition <?php if ($product['options']) echo 'options';  ?>">
                    <?php if ($product['options']) { ?>
                        <!-- Product options -->
                        <div class="product-option-wrap">
                            <div class="product-options form-horizontal">
                                <div class="options">
                                    <a class="ajax-overlay_close" href='#'></a>
                                    <h3><?php echo $text_option; ?></h3>

                                    <div class="form-group hidden">
                                        <div class="col-sm-8">
                                            <input type="text"
                                                   name="product_id"
                                                   value="<?php echo $product['product_id'] ?>"
                                                   class="form-control"/>
                                        </div>
                                    </div>

                                    <?php foreach ($product['options'] as $option) { ?>
                                        <?php if ($option['type'] == 'select') { ?>
                                            <div
                                                class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                                <label class="control-label col-sm-12"
                                                       for="input-option<?php echo $option['product_option_id'] . $pr; ?>"><?php echo $option['name']; ?></label>

                                                <div class="col-sm-12">
                                                    <select
                                                        name="option[<?php echo $option['product_option_id']; ?>]"
                                                        id="input-option<?php echo $option['product_option_id'] . $pr; ?>"
                                                        class="form-control">
                                                        <option value=""><?php echo $text_select; ?></option>
                                                        <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                                            <option
                                                                value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                                                                <?php if ($option_value['price']) { ?>
                                                                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                                                <?php } ?>
                                                            </option>
                                                        <?php } ?>
                                                    </select>
                                                </div>
                                            </div>
                                        <?php } ?>
                                        <?php if ($option['type'] == 'radio') { ?>
                                            <div
                                                class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                                <label
                                                    class="control-label col-sm-12"

                                                    ><?php echo $option['name']; ?></label>

                                                <div class="col-sm-12">
                                                    <div
                                                        id="input-option<?php echo $option['product_option_id'] . $pr; ?>">
                                                        <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                                            <div class="radio">
                                                                <label
                                                                    for="option[<?php echo $option['product_option_id'] . $option_value['product_option_value_id'] . $pr; ?>]">
                                                                    <input type="radio" hidden
                                                                           name="option[<?php echo $option['product_option_id']; ?>]"
                                                                           id="option[<?php echo $option['product_option_id'] . $option_value['product_option_value_id'] . $pr; ?>]"
                                                                           value="<?php echo $option_value['product_option_value_id']; ?>"/>
                                                                    <?php echo $option_value['name']; ?>
                                                                    <?php if ($option_value['price']) { ?>
                                                                        (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                                                    <?php } ?>
                                                                </label>
                                                            </div>
                                                        <?php } ?>
                                                    </div>
                                                </div>
                                            </div>
                                        <?php } ?>
                                        <?php if ($option['type'] == 'checkbox') { ?>
                                            <div
                                                class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                                <label
                                                    class="control-label col-sm-12
                                                "><?php echo $option['name']; ?></label>

                                                <div class="col-sm-12">
                                                    <div
                                                        id="input-option<?php echo $option['product_option_id'] . $pr; ?>">
                                                        <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                                            <div class="checkbox">
                                                                <label>
                                                                    <input type="checkbox"
                                                                           name="option[<?php echo $option['product_option_id']; ?>][]"
                                                                           value="<?php echo $option_value['product_option_value_id']; ?>"/>
                                                                    <?php echo $option_value['name']; ?>
                                                                    <?php if ($option_value['price']) { ?>
                                                                        (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                                                    <?php } ?>
                                                                </label>
                                                            </div>
                                                        <?php } ?>
                                                    </div>
                                                </div>
                                            </div>
                                        <?php } ?>
                                        <?php if ($option['type'] == 'image') { ?>
                                            <div
                                                class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                                <label
                                                    class="control-label col-sm-12
                                                "><?php echo $option['name']; ?></label>

                                                <div class="col-sm-12">
                                                    <div
                                                        id="input-option<?php echo $option['product_option_id'] . $pr; ?>">
                                                        <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                                            <div class="radio">
                                                                <label>
                                                                    <input type="radio"
                                                                           name="option[<?php echo $option['product_option_id']; ?>]"
                                                                           value="<?php echo $option_value['product_option_value_id']; ?>"/>
                                                                    <img src="<?php echo $option_value['image']; ?>"
                                                                         alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>"
                                                                         class="img-thumbnail"/> <?php echo $option_value['name']; ?>
                                                                    <?php if ($option_value['price']) { ?>
                                                                        (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                                                    <?php } ?>
                                                                </label>
                                                            </div>
                                                        <?php } ?>
                                                    </div>
                                                </div>
                                            </div>
                                        <?php } ?>
                                        <?php if ($option['type'] == 'text') { ?>
                                            <div
                                                class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                                <label class="control-label col-sm-12
                                            "
                                                       for="input-option<?php echo $option['product_option_id'] . $pr; ?>"><?php echo $option['name']; ?></label>

                                                <div class="col-sm-12">
                                                    <input type="text"
                                                           name="option[<?php echo $option['product_option_id']; ?>]"
                                                           value="<?php echo $option['value']; ?>"
                                                           placeholder="<?php echo $option['name']; ?>"
                                                           id="input-option<?php echo $option['product_option_id'] . $pr; ?>"
                                                           class="form-control"/>
                                                </div>
                                            </div>
                                        <?php } ?>
                                        <?php if ($option['type'] == 'textarea') { ?>
                                            <div
                                                class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                                <label class="control-label col-sm-12
                                            "
                                                       for="input-option<?php echo $option['product_option_id'] . $pr; ?>"><?php echo $option['name']; ?></label>

                                                <div class="col-sm-12">
                                                    <textarea name="option[<?php echo $option['product_option_id']; ?>]"
                                                              rows="5" placeholder="<?php echo $option['name']; ?>"
                                                              id="input-option<?php echo $option['product_option_id'] . $pr; ?>"
                                                              class="form-control"><?php echo $option['value']; ?></textarea>
                                                </div>
                                            </div>
                                        <?php } ?>
                                        <?php if ($option['type'] == 'file') { ?>
                                            <div
                                                class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                                <label
                                                    class="control-label col-sm-12
                                                "><?php echo $option['name']; ?></label>

                                                <div class="col-sm-12">
                                                    <button type="button"
                                                            id="button-upload<?php echo $option['product_option_id'] . $pr; ?>"
                                                            data-loading-text="<?php echo $text_loading; ?>"
                                                            class="btn btn-block btn-default"><i
                                                            class="fa fa-upload"></i> <?php echo $button_upload; ?>
                                                    </button>
                                                    <input type="hidden"
                                                           name="option[<?php echo $option['product_option_id']; ?>]"
                                                           value=""
                                                           id="input-option<?php echo $option['product_option_id'] . $pr; ?>"/>
                                                </div>
                                            </div>
                                        <?php } ?>
                                        <?php if ($option['type'] == 'date') { ?>
                                            <div
                                                class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                                <label class="control-label col-sm-12
                                            "
                                                       for="input-option<?php echo $option['product_option_id'] . $pr; ?>"><?php echo $option['name']; ?></label>

                                                <div class="col-sm-12">
                                                    <div class="input-group date">
                                                        <input type="text"
                                                               name="option[<?php echo $option['product_option_id']; ?>]"
                                                               value="<?php echo $option['value']; ?>"
                                                               data-date-format="YYYY-MM-DD"
                                                               id="input-option<?php echo $option['product_option_id'] . $pr; ?>"
                                                               class="form-control"/>
											<span class="input-group-btn">
												<button class="btn btn-default" type="button"><i
                                                        class="fa fa-calendar"></i></button>
											</span>
                                                    </div>
                                                </div>
                                            </div>
                                        <?php } ?>
                                        <?php if ($option['type'] == 'datetime') { ?>
                                            <div
                                                class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                                <label class="control-label col-sm-12
                                            "
                                                       for="input-option<?php echo $option['product_option_id'] . $pr; ?>"><?php echo $option['name']; ?></label>

                                                <div class="col-sm-12">
                                                    <div class="input-group datetime">
                                                        <input type="text"
                                                               name="option[<?php echo $option['product_option_id']; ?>]"
                                                               value="<?php echo $option['value']; ?>"
                                                               data-date-format="YYYY-MM-DD HH:mm"
                                                               id="input-option<?php echo $option['product_option_id'] . $pr; ?>"
                                                               class="form-control"/>
									<span class="input-group-btn">
									<button type="button" class="btn btn-default"><i class="fa fa-calendar"></i>
                                    </button>
									</span></div>
                                                </div>
                                            </div>
                                        <?php } ?>
                                        <?php if ($option['type'] == 'time') { ?>
                                            <div
                                                class="form-group<?php echo($option['required'] ? ' required' : ''); ?>">
                                                <label class="control-label col-sm-12
                                            "
                                                       for="input-option<?php echo $option['product_option_id'] . $pr; ?>"><?php echo $option['name']; ?></label>

                                                <div class="col-sm-12">
                                                    <div class="input-group time">
                                                        <input type="text"
                                                               name="option[<?php echo $option['product_option_id']; ?>]"
                                                               value="<?php echo $option['value']; ?>"
                                                               data-date-format="HH:mm"
                                                               id="input-option<?php echo $option['product_option_id'] . $pr; ?>"
                                                               class="form-control"/>
									<span class="input-group-btn">
									<button type="button" class="btn btn-default"><i class="fa fa-calendar"></i>
                                    </button>
									</span></div>
                                                </div>
                                            </div>
                                        <?php } ?>
                                    <?php } ?>
                                    <button class="btn btn-primary" type="button" onclick="cart.addPopup($(this),'<?php echo $product['product_id']; ?>');">
                                        <i class="fa fa-shopping-cart"></i> <span><?php echo $button_cart; ?></span>
                                    </button>
                                </div>
                            </div>
                        </div>
                    <?php } ?>
                    <div class="image">
                        <a class="lazy" style="padding-bottom: <?php echo ($product['img-height']/$product['img-width']*100); ?>%" href="<?php echo $product['href']; ?>"> <img alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" data-src="<?php echo $product['thumb']; ?>" src="#"/>
						
						<?php if ($product['rating']) { ?><div class="rating">
							<?php for ($i = 1; $i <= 5; $i++) { ?>
							<?php if ($product['rating'] < $i) { ?> <?php } else { ?>
							<span class="fa-stack"> <i class="fa fa-star fa-stack-1x"></i> </span>
							<?php } ?>
							<?php } ?>
						</div><?php } ?>
						
						<!-- stickers -->				
						<?php $i=0;
						$arr_last = $product['last_array'];
						foreach( $arr_last as $value ){
							if ($product['product_id']==$value) {  $i=1; ?>
								<span class="new_pr"><span>Novo</span></span>
								<?php
								}
							}
						?>
						<?php if ($product['special'] and $i==0 ) { ?>
								Oferta
						<?php } ?>
						<!-- -->
													
						</a>				
						
			</div>
			
				<div class="caption">	
				
				<div class="name"> <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a> </div>
				<div class="description-small"><?php echo mb_substr($product['description'],0,47,'UTF-8').'...'; ?></div>
				<div class="description"><?php echo $product['description']; ?></div>
				
					<?php if ($product['price']) { ?>
						<div class="price price-product">
							<?php if (!$product['special']) { ?>
							<?php echo $product['price']; ?>
							<?php } else { ?>
							<span class="price-old"><?php echo $product['price']; ?></span><br>
							<span class="price-new"><?php echo $product['special']; ?></span>
							<?php } ?>
							<?php if ($product['tax']) { ?>
							<span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
							<?php } ?>
						</div>
					<?php } ?>
					
					<button class="product-btn btn-add" type="button" data-toggle="tooltip" title="<?php echo $button_cart; ?>" <?php if (count($product['options']) >= 4) { ?> onclick="cart.add('<?php echo $product['product_id']; ?>');" <?php } else { ?> onclick="ajaxAdd($(this),<?php echo $product['product_id'] ?>);" <?php } ?>><i class="fa fa-shopping-cart"></i></button>
						
				</div>
			
				<div class="cart-button">					
					<button class="product-btn" type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
					<button class="product-btn" type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart-o"></i></button>					
				</div>
				
                <div class="aside">
				
					<?php if ($product['rating']) { ?><div class="rating">
						<?php for ($i = 1; $i <= 5; $i++) { ?>
						<?php if ($product['rating'] < $i) { ?> <?php } else { ?>
						<span class="fa-stack"> <i class="fa fa-star fa-stack-1x"></i> </span>
						<?php } ?>
						<?php } ?>
					</div><?php } ?>
					
					<?php if ($product['price']) { ?>
						<div class="price price-product">
							<?php if (!$product['special']) { ?>
							<?php echo $product['price']; ?>
							<?php } else { ?>
							<span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
							<?php } ?>
							<?php if ($product['tax']) { ?>
							<span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
							<?php } ?>
						</div>
					<?php } ?>

					<div>
						<button class="btn-primary" type="button" <?php if (count($product['options']) >= 4) { ?> onclick="cart.add('<?php echo $product['product_id']; ?>');" <?php } else { ?> onclick="ajaxAdd($(this),<?php echo $product['product_id'] ?>);" <?php } ?>><i class="fa fa-shopping-cart"></i> <span><?php echo $button_cart; ?></span></button>
						<div class="clear"></div>                		
                		<button class="btn btn-product" type="button" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i> <span><?php echo $button_compare; ?></span></button>
						<button class="btn btn-product" type="button" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart-o"></i> <span><?php echo $button_wishlist; ?></span></button>
                	</div>
					
                </div>
                </div>
                <div class="clear"></div>
            </div>
		<?php } ?>
	  </div>
	  <div class="row">
		<div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
		<div class="col-sm-6 text-right"><?php echo $results; ?></div>
	  </div>
	  <?php } else { ?>
	  <p><?php echo $text_empty; ?></p>
	  <div class="buttons">
		<div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
	  </div>
	  <?php } ?>
	  <?php echo $content_bottom; ?></div>
	<?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>