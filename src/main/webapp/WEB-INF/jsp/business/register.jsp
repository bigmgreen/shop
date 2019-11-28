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
					<input type="text" class="form-control" id="username" name="username" placeholder="请输入用户名">
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<label for="email">邮箱</label>
					<input type="text" class="form-control" id="email" name="email" placeholder="请输入邮箱">
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<label for="password">密码</label>
					<input type="password" class="form-control" id="password" name="password" placeholder="请输入密码">
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<label for="confirmpassword">确认密码</label>
					<input type="password" class="form-control" id="confirmpassword" name="confirmpassword" placeholder="请确认密码">
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
				<button id="submit" type="button" class="center-block btn btn-submit">注册</button>
			</div>
		</form>
	</div>
</div>

<script>
	//前台格式验证
	function nameFn() {
		var obj = $.trim($("#username").val()) ? true : false;
		return obj;
	}
	function passwordFn() {
		var obj = $("#password").val() ? true : false;
		return obj;
	}
	function password_againFn() {
		var obj = $("#confirmpassword").val();
		return !!obj && $("#password").val() === obj;
	}
	function emailFn() {
		var email = $.trim($("#email").val());
		var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
		return !!email && reg.test(email);
	}
	function codeFn() {
		return $.trim($("#code").val()) ? true : false;
	}
	
	$(function() {
		var username = $('#username');
		var pwd = $('#password');
		var confirmpassword = $('#confirmpassword');
		var email = $('#email');
		var code = $('#code');
		var error = $('.text-danger');
		var submit = $('#submit');
		
		$('.img-code').click(function() {
			$(this).attr('src', '/shop/do.code?v=' + (+new Date()));
		});
		
		submit.click(function() {
			if (!nameFn()) {
				username.focus();
				error.html('用户名不能为空');
				return;
			}
			if (!emailFn()) {
				email.focus();
				error.html('邮箱不能为空或格式错误');
				return;
			}
			if (!passwordFn()) {
				pwd.focus();
				error.html('密码不能为空');
				return;
			}
			if (!password_againFn()) {
				confirmpassword.focus();
				error.html('确认密码不能为空');
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
					$.post('/shop/register.do', {
						username: username.val(),
						email: email.val(),
						password: pwd.val(),
					}).done(function (res) {
						if (res.code === 0) {
							location.href = '/shop/index.html';
						} else {
							error.html(res.msg);	
						}
					}).complete(function (res) {
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