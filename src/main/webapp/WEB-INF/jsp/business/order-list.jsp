<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="../public/header.jsp"%>

<link href="/static/css/order-list.css" rel="stylesheet" type="text/css" media="all" />

<div class="orders block">
	<div class="orders__tab clearfix">
		<div class="orders__tab__a active">所有订单</div>
		<div class="orders__tab__a">待付款</div>
		<div class="orders__tab__a">待发货</div>
		<div class="orders__tab__a">待收货</div>
		<div class="orders__tab__a">待评价</div>
	</div>
	
	<div class="orders__list">
		<div class="orders__list__head">
			<span>订单详情</span>
			<span>收货人</span>
			<span>金额</span>
			<span>状态</span>
			<span>操作</span>
		</div>
		<div class="orders__list__item">
			<div class="orders__list__item--head">
				<div class="orders__list__item--head__date">2019-11-23</div>
				<div class="orders__list__item--head__number">订单号: 728905888963771559</div>
				<div class="orders__list__item--head__del">删除</div>
			</div>
			<div class="orders__list__item__main">
				<img class="orders__list__item__main__img" src="//img.alicdn.com/imgextra/i2/3485517560/O1CN01mmDQGw25iWpCMKsot_!!3485517560.jpg_80x80.jpg" />
				<b class="orders__list__item__main__title">毛呢阔腿裤女秋冬季加绒加厚高腰垂感直筒黑色宽松显瘦九分休闲裤</b>
				<span class="orders__list__item__main__count">x1</span>
				<span class="orders__list__item__main__user">zx</span>
				<span class="orders__list__item__main__price">￥299</span>
				<span class="orders__list__item__main__status">待发货</span>
				<span class="orders__list__item__main__do">
					<span class="orders__list__item__main__do__btn">确认收货</span>
				</span>
			</div>
		</div>
		<div class="orders__list__item">
			<div class="orders__list__item--head">
				<div class="orders__list__item--head__date">2019-11-23</div>
				<div class="orders__list__item--head__number">订单号: 728905888963771559</div>
				<div class="orders__list__item--head__del">删除</div>
			</div>
			<div class="orders__list__item__main">
				<img class="orders__list__item__main__img" src="//img.alicdn.com/imgextra/i2/3485517560/O1CN01mmDQGw25iWpCMKsot_!!3485517560.jpg_80x80.jpg" />
				<b class="orders__list__item__main__title">毛呢阔腿裤女秋冬季加绒加厚高腰垂感直筒黑色宽松显瘦九分休闲裤</b>
				<span class="orders__list__item__main__count">x1</span>
				<span class="orders__list__item__main__user">zx</span>
				<span class="orders__list__item__main__price">￥299</span>
				<span class="orders__list__item__main__status">待发货</span>
				<span class="orders__list__item__main__do">
					<span class="orders__list__item__main__do__btn">确认收货</span>
				</span>
			</div>
		</div>
		<div class="orders__list__item">
			<div class="orders__list__item--head">
				<div class="orders__list__item--head__date">2019-11-23</div>
				<div class="orders__list__item--head__number">订单号: 728905888963771559</div>
				<div class="orders__list__item--head__del">删除</div>
			</div>
			<div class="orders__list__item__main">
				<img class="orders__list__item__main__img" src="//img.alicdn.com/imgextra/i2/3485517560/O1CN01mmDQGw25iWpCMKsot_!!3485517560.jpg_80x80.jpg" />
				<b class="orders__list__item__main__title">毛呢阔腿裤女秋冬季加绒加厚高腰垂感直筒黑色宽松显瘦九分休闲裤</b>
				<span class="orders__list__item__main__count">x1</span>
				<span class="orders__list__item__main__user">zx</span>
				<span class="orders__list__item__main__price">￥299</span>
				<span class="orders__list__item__main__status">待发货</span>
				<span class="orders__list__item__main__do">
					<span class="orders__list__item__main__do__btn">确认收货</span>
				</span>
			</div>
		</div>
	</div>
</div>

<div class="block">
	<nav class="pull-right">
	  <ul class="pagination">
	    <li class=".disabled"><a href="#"><span>&laquo;</span></a></li>
	    <li class="active"><a href="#">1</a></li>
	    <li><a href="#">2</a></li>
	    <li><a href="#">3</a></li>
	    <li><a href="#">4</a></li>
	    <li><a href="#">5</a></li>
	    <li><a href="#"><span>&raquo;</span></a></li>
	  </ul>
	</nav>
</div>

<script>
	$(function() {
		
	});
</script>

<%@ include file="../public/footer.jsp"%>
