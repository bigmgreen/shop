<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="./taglibs.jsp"%>

<!DOCTYPE HTML>
<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="Cache-Control" content="no-transform" />
<meta name="format-detection" content="telephone=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="renderer" content="webkit" />
<meta name="keywords" content="购购,网上购物,C2C,在线交易,交易市场,网上交易,交易市场,网上买" />
<meta name="description" content="购购网 - 亚洲较大的网上交易平台，提供各类服饰、美容、家居、数码、话费/点卡充值… 数亿优质商品，同时提供担保交易(先收货后付款)等安全交易保障服务，并由商家提供退货承诺、破损补寄等消费者保障服务，让你安心享受网上购物乐趣！" />

<title><c:out value="${title}"></c:out>购购网 - 购！我喜欢</title>

<link href="/static/css/reset.css" rel="stylesheet" type="text/css" media="all" />
<link href="/static/lib/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all" />
<link href="/static/css/base.css" rel="stylesheet" type="text/css" media="all" />

<script src="/static/lib/jquery1.9.1/jquery.min.js"></script>
<script src="/static/lib/bootstrap-3.3.7/js/bootstrap.min.js"></script>

</head>
<body>

<header>
	<div class="top">
		<div class="top__main block">
			<% String name = (String)request.getSession().getAttribute("name"); %>
			<c:choose>
			    <c:when test="${name == null}">
				    <div class="top__right">
						<a href="/shop/login.html"><b>亲，请登录</b></a>
						<a href="/shop/register.html">免费注册</a>
					</div>
			    </c:when>
			    <c:otherwise>
			    	<div class="top__left">
				    	<a href="/shop/userinfo.user"><b>您好：<c:out value="${name}"></c:out></b></a>
				    	<a href="/shop/userlogout.user">退出</a>
			    	</div>
			    	<div class="top__right">
						<a href="/shop/userinfo.user">个人中心</a>
						<a href="/shop/carlist.user"><span class="glyphicon glyphicon-shopping-cart"></span>购物车</a>
						<a href="/shop/orders.user">我的订单</a>
					</div>
			    </c:otherwise>
			</c:choose>
		</div>
	</div>
	
	<div class="search">
		<div class="search__main block">
			<a class="search__logo" href="/shop/index.html"><img src="/static/img/logo.png" /></a>
			<form class="search__form" onsubmit="return false;">
				<div class="search__form__input">
					<span class="glyphicon glyphicon-search"></span>
					<input type="text" placeholder="请输入搜索文字" maxlength="50" />
					<button class="search__form__btn" type="button">搜索</button>
				</div>
			</form>
		</div>
	</div>
	
	<div class="nav">
		<div class="block">
			<a href="/shop/index.html">首页</a>
			<a href="#">男裤</a>
			<a href="#">女裤</a>
			<a href="#">男鞋</a>
			<a href="#">女鞋</a>
		</div>
	</div>
</header>