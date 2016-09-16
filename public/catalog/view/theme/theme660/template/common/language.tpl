<?php if (count($languages) > 1) { ?>
<li class="box-language">
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="language">
  <div class="btn-group ">
	<span class="dropdown-toggle" data-toggle="dropdown">
	<?php foreach ($languages as $language) { ?>
	<?php if ($language['code'] == $code) { ?>
		<span><?php echo $language['name']; ?></span> 
	<?php } ?>
	<?php } ?>	</span>
	<ul class="dropdown-menu  list-unstyled">
	  <?php foreach ($languages as $language) { ?>
		<?php if ($language['code'] == $code) { ?>
			<li><a class="select" href="<?php echo $language['code']; ?>"><img class="hidden" src="image/flags/<?php echo $language['image']; ?>" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
		<?php } else { ?>
		<li><a href="<?php echo $language['code']; ?>"><img class="hidden" src="image/flags/<?php echo $language['image']; ?>" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
		<?php } ?>
	  <?php } ?>
	</ul>
  </div>
  <input type="hidden" name="code" value="" />
  <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
</form>
</li>
<?php } ?>
