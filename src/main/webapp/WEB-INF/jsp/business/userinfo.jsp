<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="../public/header.jsp"%>

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
					<label for="address">地址</label>
					<input type="text" class="form-control" id="address" name="address" placeholder="请输入地址">
				</div>
			</div>
			<div class="row">
				<button type="button" class="center-block btn btn-submit">更新</button>
			</div>
		</form>
	</div>
</div>

<script>
	$(function() {
		
	});
</script>

<%@ include file="../public/footer.jsp"%>