<?php if ($error_warning) { ?>
<div class="alert alert-error"><?php echo $error_warning; ?><a class="close" data-dismiss="alert">×</a></div>
<?php } ?>
<div class="box">
	<div class="heading">
		<h2><?php echo $heading_title; ?></h2>
		<div class="buttons"><button onclick="$('#form').submit();" class="btn btn-primary"><?php echo $button_save; ?></button> <button onclick="location = '<?php echo $cancel; ?>';" class="btn"><?php echo $button_cancel; ?></button></div>
	</div>
	<div class="content">
		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
			<table id="module" class="list">
				<thead>
					<tr>
						<td class="left" width="20%"><?php echo $entry_name; ?></td>
						<td class="left" width="30%"><?php echo $entry_client_id; ?></td>
						<td class="left" width="30%"><?php echo $entry_client_secret; ?></td>
						<td class="right" width="10%"><?php echo $entry_sort_order; ?></td>
						<td class="right" width="10%"><?php echo $entry_status; ?></td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="left">FACEBOOK</td>
						<td class="left"><input type="text" class="t" name="oauth[facebook][client_id]" value="<?php echo isset($oauth['facebook'])?$oauth['facebook']['client_id']:''; ?>" /></td>
						<td class="left"><input type="text" class="t" name="oauth[facebook][client_secret]" value="<?php echo isset($oauth['facebook'])?$oauth['facebook']['client_secret']:''; ?>" /></td>
						<td class="right"><input type="text" name="oauth[facebook][sort]" value="<?php echo isset($oauth['facebook'])?$oauth['facebook']['sort']:'0'; ?>" /></td>
						<td class="right"><select name="oauth[facebook][status]">
							<?php if ($oauth && $oauth['facebook']['status']) { ?>
							<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
							<option value="0"><?php echo $text_disabled; ?></option>
							<?php } else { ?>
							<option value="1"><?php echo $text_enabled; ?></option>
							<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
							<?php } ?>
						</select></td>
					</tr>
					<tr>
						<td class="left">Microsoft</td>
						<td class="left"><input type="text" class="t" name="oauth[live][client_id]" value="<?php echo isset($oauth['live'])?$oauth['live']['client_id']:''; ?>" /></td>
						<td class="left"><input type="text" class="t" name="oauth[live][client_secret]" value="<?php echo isset($oauth['live'])?$oauth['live']['client_secret']:''; ?>" /></td>
						<td class="right"><input type="text" name="oauth[live][sort]" value="<?php echo isset($oauth['live'])?$oauth['live']['sort']:'0'; ?>" /></td>
						<td class="right"><select name="oauth[live][status]">
							<?php if ($oauth && $oauth['live']['status']) { ?>
							<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
							<option value="0"><?php echo $text_disabled; ?></option>
							<?php } else { ?>
							<option value="1"><?php echo $text_enabled; ?></option>
							<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
							<?php } ?>
						</select></td>
					</tr>
					<tr>
						<td class="left">GOOGLE</td>
						<td class="left"><input type="text" class="t" name="oauth[google][client_id]" value="<?php echo isset($oauth['google'])?$oauth['google']['client_id']:''; ?>" /></td>
						<td class="left"><input type="text" class="t" name="oauth[google][client_secret]" value="<?php echo isset($oauth['google'])?$oauth['google']['client_secret']:''; ?>" /></td>
						<td class="right"><input type="text" name="oauth[google][sort]" value="<?php echo isset($oauth['google'])?$oauth['google']['sort']:'0'; ?>" /></td>
						<td class="right"><select name="oauth[google][status]">
							<?php if ($oauth && $oauth['google']['status']) { ?>
							<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
							<option value="0"><?php echo $text_disabled; ?></option>
							<?php } else { ?>
							<option value="1"><?php echo $text_enabled; ?></option>
							<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
							<?php } ?>
						</select></td>
					</tr>
					<tr>
						<td class="left">QQ</td>
						<td class="left"><input type="text" class="t" name="oauth[qq][client_id]" value="<?php echo isset($oauth['qq'])?$oauth['qq']['client_id']:''; ?>" /></td>
						<td class="left"><input type="text" class="t" name="oauth[qq][client_secret]" value="<?php echo isset($oauth['qq'])?$oauth['qq']['client_secret']:''; ?>" /></td>
						<td class="right"><input type="text" name="oauth[qq][sort]" value="<?php echo isset($oauth['qq'])?$oauth['qq']['sort']:'0'; ?>" /></td>
						<td class="right"><select name="oauth[qq][status]">
							<?php if ($oauth && $oauth['qq']['status']) { ?>
							<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
							<option value="0"><?php echo $text_disabled; ?></option>
							<?php } else { ?>
							<option value="1"><?php echo $text_enabled; ?></option>
							<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
							<?php } ?>
						</select></td>
					</tr>
					<tr>
						<td class="left">新浪微博</td>
						<td class="left"><input type="text" class="t" name="oauth[weibo][client_id]" value="<?php echo isset($oauth['weibo'])?$oauth['weibo']['client_id']:''; ?>" /></td>
						<td class="left"><input type="text" class="t" name="oauth[weibo][client_secret]" value="<?php echo isset($oauth['weibo'])?$oauth['weibo']['client_secret']:''; ?>" /></td>
						<td class="right"><input type="text" name="oauth[weibo][sort]" value="<?php echo isset($oauth['weibo'])?$oauth['weibo']['sort']:'0'; ?>" /></td>
						<td class="right"><select name="oauth[weibo][status]">
							<?php if ($oauth && $oauth['weibo']['status']) { ?>
							<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
							<option value="0"><?php echo $text_disabled; ?></option>
							<?php } else { ?>
							<option value="1"><?php echo $text_enabled; ?></option>
							<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
							<?php } ?>
						</select></td>
					</tr>
					<tr>
						<td class="left">百度登陆</td>
						<td class="left"><input type="text" class="t" name="oauth[baidu][client_id]" value="<?php echo isset($oauth['baidu'])?$oauth['baidu']['client_id']:''; ?>" /></td>
						<td class="left"><input type="text" class="t" name="oauth[baidu][client_secret]" value="<?php echo isset($oauth['baidu'])?$oauth['baidu']['client_secret']:''; ?>" /></td>
						<td class="right"><input type="text" name="oauth[baidu][sort]" value="<?php echo isset($oauth['baidu'])?$oauth['baidu']['sort']:'0'; ?>" /></td>
						<td class="right"><select name="oauth[baidu][status]">
							<?php if ($oauth && $oauth['baidu']['status']) { ?>
							<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
							<option value="0"><?php echo $text_disabled; ?></option>
							<?php } else { ?>
							<option value="1"><?php echo $text_enabled; ?></option>
							<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
							<?php } ?>
						</select></td>
					</tr>
				</tbody>
			</table>
		</form>
		<form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="delete">
			<?php if ($oauth_list) { ?>
			<h2>Customer List</h2>
			<table class="list">
				<thead>
					<tr>
						<td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
						<td class="left"><?php echo $entry_c_nickname; ?></td>
						<td class="left"><?php echo $entry_name; ?></td>
						<td class="left"><?php echo $entry_c_email; ?></td>
						<td class="left"><?php echo $entry_c_name; ?></td>
						<td class="right"><?php echo $entry_c_openid; ?></td>
						<td class="right"><?php echo $entry_c_date; ?></td>
					</tr>
				</thead>
				<tbody id="list">
					<?php foreach ($oauth_list as $list) { ?>
					<tr>
						<td class="left"><input type="checkbox" name="selected[]" value="<?php echo $list['oauth_id']; ?>" /></td>
						<td class="left"><?php echo $list['name']; ?></td>
						<td class="left"><?php echo $list['type']; ?></td>
						<td class="left"><a href="<?php echo $list['href']; ?>"><?php echo $list['email']; ?></a></td>
						<td class="left"><?php echo $list['firstname'].' '.$list['lastname']; ?></td>
						<td class="right"><?php echo $list['openid']; ?></td>
						<td class="right"><?php echo $list['date_added']; ?></td>
					</tr>
					<?php } ?>
				</tbody>
			</table>
			<div class="pages">
				<div class="left">
					<div class="page-del"><a onclick="Remove();" class="remove"><?php echo $button_remove; ?></a></div>
				</div>
				<div class="right">
					<div class="page-btn"><?php echo $pagination; ?></div>
					<div class="page-jump"><input type="text" value="1" id="jump" /><input type="button" value="GO" onclick="Jump($('#jump').val());" /></div>
				</div>
			</div>
			<?php } ?>
		</form>
	</div>
</div>
<script type="text/javascript"><!--
function Jump(page) {
if (Number(page) <= <?php echo $maxpage; ?>) {
show(page);
} else {
alert('<?php echo $error_jump; ?>');
}
}
function Remove() {
$.ajax({
type: 'POST',
url: '<?php echo $delete; ?>',
data: $('#list input[type=\'checkbox\']:checked'),
dataType: 'json',
success: function(json) {
if (!json['error']) {
show(1);
} else {
alert(json['error']);
}
}
});
}
function show(page) {
$.ajax({
type: 'GET',
url: 'index.php?route=module/oauth/getlist&token=<?php echo $token; ?>',
data: {'page':page},
dataType: 'json',
success: function(json) {
if (!json['error']) {
var html  = '';

for (var i = 0; i < json['data'].length; i ++) {
html += '<tr>';
	html += '  <td class="left"><input type="checkbox" name="selected[]" value="'+json['data'][i]['oauth_id']+'" /></td>';
	html += '  <td class="left">'+json['data'][i]['name']+'</td>';
	html += '  <td class="left">'+json['data'][i]['type']+'</td>';
	html += '  <td class="left"><a href="'+json['data'][i]['href']+'">'+json['data'][i]['email']+'</a></td>';
	html += '  <td class="left">'+json['data'][i]['firstname']+' '+json['data'][i]['lastname']+'</td>';
	html += '  <td class="right">'+json['data'][i]['openid']+'</td>';
	html += '  <td class="right">'+json['data'][i]['date_added']+'</td>';
html += '</tr>';
}

$('#list').html(html);
$('.page-btn').html(json['pagination']);
} else {
// 输出错误
alert(json['error']);
}
}
});
}
//--></script>