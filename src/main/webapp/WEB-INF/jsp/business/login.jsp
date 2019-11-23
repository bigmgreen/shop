<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="../public/header.jsp"%>

<link href="/static/css/login.css" rel="stylesheet" type="text/css"
	media="all" />

<div class="login">
	<div class="login__bg"></div>
	<div class="login__form block">
		<form class="login__form__main">
			<h3>欢迎登录</h3>
			<div class="form-group">
				<label for="username">用户名/邮箱</label>
				<input type="text" class="form-control" id="username" name="username" placeholder="请输入用户名/邮箱">
			</div>
			<div class="form-group">
				<label for="password">密码</label>
				<input type="password" class="form-control" id="password" name="password" placeholder="请输入密码">
			</div>
			<p class=text-danger></p>
			<button id="submit" type="button" class="center-block btn btn-submit">提交</button>
			<p class="help-block clearfix">
				<a href="/shop/resetpwd.html">忘记密码</a>
				<a href="/shop/register.html">注册</a>
			</p>
		</form>
	</div>
</div>

<script>
	$(function() {
		var name = $('#username');
		var pwd = $('#password');
		var error = $('.text-danger');
		var submit = $('#submit');
		
		submit.click(function(e) {
			if (name.val() === '') {
				error.html('用户名/邮箱不能为空');
				return;
			}
			if (pwd.val() === '') {
				error.html('密码不能为空');
				return;
			}
			
			submit.attr('disabled', true);
			$.post('/shop/login.do', {
				username: $('#username').val(),
				password: $('#password').val(),
			}).done(function (res) {
				if (res.code === 0) {
					location.href = '/shop/index.html';
				} else {
					error.html(res.msg);	
				}
			}).complete(function() {
				submit.attr('disabled', false);
			});
		});
	});
</script>

<%@ include file="../public/footer.jsp"%>