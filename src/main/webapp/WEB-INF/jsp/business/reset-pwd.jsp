<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="../public/header.jsp"%>

<link href="/static/css/userinfo.css" rel="stylesheet" type="text/css"
	media="all" />

<div class="userinfo">
	<div class="userinfo__form block">
		<form class="userinfo__form__main">
			<div class="row">
				<div class="form-group">
					<label for="email">邮箱</label>
					<input type="text" class="form-control" id="email" name="email" placeholder="请输入邮箱">
				</div>
			</div>
			<div class="row">
				<div class="form-group">
					<label for="emailcode">邮箱验证码</label>
					<div class="input-group">
				      <input type="text" class="form-control" id="emailcode" name="emailcode" placeholder="请输入邮箱验证码">
				      <span class="input-group-btn">
				        <button class="btn btn-primary" type="button">发送验证码</button>
				      </span>
				    </div>
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
				<button type="button" class="center-block btn btn-submit">重置</button>
			</div>
		</form>
	</div>
</div>

<script>
	$(function() {
		
	});
</script>

<%@ include file="../public/footer.jsp"%>