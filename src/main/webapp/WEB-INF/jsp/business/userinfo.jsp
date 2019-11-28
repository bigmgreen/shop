<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="./public/header.jsp"%>

<link href="/static/css/userinfo.css" rel="stylesheet" type="text/css"
	media="all" />

<div class="userinfo">
	<div class="userinfo__form block">
		<form class="userinfo__form__main">
			<div class="row">
				<div class="form-group">
					<label for="username">用户名</label>
					<input 
						type="text" 
						class="form-control" 
						id="username" 
						name="username" 
						readonly="readonly"
						disabled="disabled"
						placeholder="请输入用户名"
						value='<c:out value="${user.name}"></c:out>'
					>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<label for="email">邮箱</label>
					<input 
						type="text" 
						class="form-control" 
						id="email" 
						name="email" 
						readonly="readonly"
						disabled="disabled"
						placeholder="请输入邮箱"
						value='<c:out value="${user.email}"></c:out>'
					>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<label for="postcode">邮编</label>
					<input 
						type="text" 
						class="form-control" 
						id="postcode" 
						name="postcode" 
						placeholder="请输入邮编"
						value='<c:out value="${user.postelcode}"></c:out>'
					>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<label for="address">地址</label>
					<input 
						type="text" 
						class="form-control" 
						id="address" 
						name="address" 
						placeholder="请输入地址"
						value='<c:out value="${user.address}"></c:out>'
					>
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<label for="code">验证码</label>
					<div class="input-group">
				      <input type="text" class="form-control" id="code" name="code" placeholder="请输入验证码">
				      <span class="input-group-btn">
				        <img src="/shop/do.code" class="img-code" />
				      </span>
				    </div>
				</div>
			</div>
			<div class="row">
				<p class="text-danger"></p>
			</div>
			<div class="row">
				<button id="submit" type="button" class="center-block btn btn-submit">更新</button>
			</div>
		</form>
	</div>
</div>

<div class="modal fade" id="modal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="myModalLabel">提示</h4>
      </div>
      <div class="modal-body">用户信息更新成功~</div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
      </div>
    </div>
  </div>
</div>

<script>
	//前台格式验证
	function postcodeFn() {
		return $.trim($("#postcode").val()) ? true : false;
	}
	function addressFn() {
		return $.trim($("#address").val()) ? true : false;
	}
	function codeFn() {
		return $.trim($("#code").val()) ? true : false;
	}
	
	$(function() {
		var postcode = $('#postcode');
		var address = $('#address');
		var code = $('#code');
		var error = $('.text-danger');
		var submit = $('#submit');
		
		$('.img-code').click(function() {
			$(this).attr('src', '/shop/do.code?v=' + (+new Date()));
		});
		
		submit.click(function() {
			if (!postcodeFn()) {
				postcode.focus();
				error.html('邮编不能为空');
				return;
			}
			if (!addressFn()) {
				address.focus();
				error.html('地址能为空');
				return;
			}
			if (!codeFn()) {
				code.focus();
				error.html('验证码不能为空');
				return;
			}
			
			submit.attr('disabled', true);
			var self = this;
			$.post('/shop/check.code', {
				code: code.val(),
			}).done(function (res) {
				if (res.code === 0) {
					submit.attr('disabled', true);
					$.post('/shop/userinfo.user', {
						postcode: postcode.val(),
						address: address.val(),
					}).done(function (res) {
						if (res.code === 0) {
							$('#modal').modal();
						} else {
							error.html(res.msg);
						}
					}).complete(function(res) {
						complete(res, $(self));
					});
				} else {
					submit.attr('disabled', false);
					error.html(res.msg);	
				}
			}).complete(function (res) {
				complete(res, $(self));
			});
		});
	});
</script>

<%@ include file="./public/footer.jsp"%>