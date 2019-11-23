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
				<label for="username">用户名</label>
				<input type="text" class="form-control" id="username" name="username" placeholder="请输入用户名">
			</div>
			<div class="form-group">
				<label for="password">密码</label>
				<input type="password" class="form-control" id="password" name="password" placeholder="请输入密码">
			</div>
			<button type="submit" class="center-block btn btn-submit">提交</button>
			<p class="help-block clearfix">
				<a href="/shop/resetpwd.html">忘记密码</a>
				<a href="/shop/register.html">注册</a>
			</p>
		</form>
	</div>
</div>

<script>
	$(function() {
		/* 验证码 显示  */
		shop.code();
		/* 监控页面上如果有enter键按下  */
		$(document).keydown(function(e) {
			if (e.keyCode == 13) {
				/* 如果被按下就执行验证码验证 ，防止用户在验证码输入不对的情况下，进行登陆   */
				$("#login_code_input").blur();
			}
		});
		/* 按下登陆按钮时执行登陆操作  */
		$("#submit").click(function(e) {
			/* 登陆操作，如果登陆失败，会显示圆括号里的文字 ，反之不会  */
			shop.login('用户名或者密码错误');
		});
	});
</script>

<%@ include file="../public/footer.jsp"%>