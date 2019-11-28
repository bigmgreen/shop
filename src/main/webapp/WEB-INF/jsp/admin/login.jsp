<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="../public/taglibs.jsp"%>

<c:set var="pageId" scope="session" value="${-1}"/>

<%@ include file="./public/header.jsp"%>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-4 col-md-offset-4">
			<div class="panel panel-primary">
				<div class="panel-heading">
				  <h3 class="panel-title">请使用管理员账户</h3>
				</div>
				<div class="panel-body">
				  <form>
					<div class="form-group">
						<label for="username">用户名</label>
						<input type="text" class="form-control" id="username" name="username" placeholder="请输入用户名">
					</div>
					<div class="form-group">
						<label for="password">密码</label>
						<input type="password" class="form-control" id="password" name="password" placeholder="请输入密码">
					</div>
					<p class=text-danger></p>
				  </form>
				</div>
				<div class="panel-footer">
					<div id="submit" class="btn btn-primary center-block">登录</div>
				</div>
			</div>
		</div>
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
				error.html('用户名不能为空');
				return;
			}
			if (pwd.val() === '') {
				error.html('密码不能为空');
				return;
			}
			
			submit.attr('disabled', true);
			$.post('/admin/login.do', {
				username: $('#username').val(),
				password: $('#password').val(),
			}).done(function (res) {
				if (res.code === 0) {
					location.href = '/admin/index.admin';
				} else {
					error.html(res.msg);	
				}
			}).complete(function() {
				submit.attr('disabled', false);
			});
		});
	});
</script>

<%@ include file="./public/footer.jsp"%>