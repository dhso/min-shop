<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
 <div class="attention"><?php echo $text_current_version; ?></div>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/setting.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onClick="window.open('http://www.minws.com/');" class="button"><span><?php echo $text_check; ?></span></a></div>
    </div>
    <div class="content">
       <p style="padding:10px;">
       	该系统是一套基于GPL开源协议的,基于MVC架构的PHP开源电子商务网店系统，是目前中文领域里真正开源免费的网店系统。我们会定期的更新和发布新的版本，您可以通过访问我们的网站<a href="http://www.minws.com/">Minws 名网</a>
       	获取最新版本。
       </p>
    </div>
  </div>
</div>

<?php echo $footer; ?>