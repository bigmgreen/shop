<!-- 登陆页面 	shop/index.jsp中使用 -->
<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="../public/header.jsp"%>

<div id="content" class="login_position" style="height: 250px;">
	<div id="twitter" style="padding-top: 3%;">
		<form onsubmit="return false;">
			<div id='name' class='outerDiv' style="left: 50%;">
				<label for="name" style="padding-left: 15%;"> 姓名:</label> <input
					id="login_input_name" type="text" name="name" required
					placeholder="用户名或者邮箱" />
			</div>
			<div class='clearfix'></div>
			<div id='password' class='outerDiv'>
				<label for="number" style="padding-left: 15%;"> 密码:</label> <input
					id="login_input_psd" type="password" name="password" required />
			</div>
			<div class='clearfix'></div>
			<div id='code' class='outerDiv'>
				<label for="code" style="padding-left: 15%;"> 验证码:</label> <input
					id="login_code_input" onclick="shop.clear();" type="text"
					name="code" required onblur="shop.checkCode($(this), '验证码填写错误')" />
				<div class='message_register' id='emailDiv'>
					<img style="cursor: pointer;" id="code_img" class="lazyOwl" src=""
						alt="Lazy Owl Image" title="点击更换" onclick="shop.code();">
				</div>
			</div>
			<div id="error_div_before" class='clearfix'></div>
			<div id='submit' class='outerDiv' style="padding-left: 15%;">
				<input type="submit" value="登录" onsubmit="return false;" />
			</div>
			<div class='clearfix'></div>
		</form>
		<div class="clearfix"></div>
	</div>
</div>
<div style="margin: 25px auto"></div>
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