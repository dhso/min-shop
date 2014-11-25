<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<?php if ($payment_methods) { ?>
<p><?php echo $text_payment_method; ?></p>
<div class="form">
  <?php foreach ($payment_methods as $payment_method) { ?>
    <?php if ($payment_method['code'] == $payment_code &&  $payment_code!='') { ?>
      <input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" id="<?php echo $payment_method['code']; ?>" checked="checked" />
      <?php } else { ?>
      <input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" id="<?php echo $payment_method['code']; ?>" />
      <?php } ?></td>
    <label for="<?php echo $payment_method['code']; ?>"><?php echo $payment_method['title']; ?></label>&nbsp;&nbsp;
  <?php } ?>
</div>
<?php } ?>

