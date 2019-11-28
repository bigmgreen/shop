<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="../../public/taglibs.jsp"%>

<!DOCTYPE HTML>
<html>

<head>

	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta http-equiv="Cache-Control" content="no-transform" />
	<meta name="format-detection" content="telephone=no" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta name="renderer" content="webkit" />
	
	<title>管理系统 | 购购网 - 购！我喜欢</title>
	
	<link href="/static/css/reset.css" rel="stylesheet" type="text/css" media="all" />
	<link href="/static/lib/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all" />
	<link href="/static/css/base.css" rel="stylesheet" type="text/css" media="all" />
	
	<script src="/static/lib/jquery1.9.1/jquery.min.js"></script>
	<script src="/static/lib/bootstrap-3.3.7/js/bootstrap.min.js"></script>
	<script src="/static/js/base.js"></script>

</head>
<body>

<div class="modal fade" id="errorModal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">提示</h4>
      </div>
      <div class="modal-body">系统维护中，请稍后重试~</div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="loginModal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">提示</h4>
      </div>
      <div class="modal-body">您没有登录或登录超时，请重新登录~</div>
      <div class="modal-footer">
        <a href="/shop/login.html" class="btn btn-primary">去登录</a>
      </div>
    </div>
  </div>
</div>

<div class="container-fluid">
	<h3 class="page-title"><small>欢迎访问</small>- 购购网 -<small>管理系统</small> </h3>
</div>

<c:if test="${pageId ne -1}">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-2 col-sm-2">
				<ul class="nav nav-pills nav-stacked">
				  <li role="presentation" <c:if test="${pageId eq 1}">class="active"</c:if>><a href="/shop/index.admin">首页</a></li>
				  <li role="presentation" <c:if test="${pageId eq 2}">class="active"</c:if>><a href="/shop/index.admin">用户列表</a></li>
				  <li role="presentation" <c:if test="${pageId eq 3}">class="active"</c:if>><a href="/shop/index.admin">商品列表</a></li>
				  <li role="presentation" <c:if test="${pageId eq 4}">class="active"</c:if>><a href="/shop/index.admin">评价列表</a></li>
				</ul>
			</div>
			<div class="col-md-10 col-sm-10">
				<header>
					<ol class="breadcrumb">
					  <li><a href="/shop/index.admin">首页</a></li>
					  <li class="active"><c:out value="${title}"></c:out></li>
					</ol>
				</header>

</c:if>