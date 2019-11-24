<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="../public/header.jsp"%>

<link href="/static/css/detail.css" rel="stylesheet" type="text/css" media="all" />

<div class="detail block">
	<div class="detail__preview">
		<img class="detail__preview__img" src="" />
		
		<div class="detail__preview__imgs">
			<span><img src="" /></span>
			<span><img src="" /></span>
			<span><img src="" /></span>
			<span><img src="" /></span>
			<span><img src="" /></span>
			<span><img src="" /></span>
		</div>
	</div>
	<div class="detail__info">
		<div class="detail__info__title">夏天盖世英雄纯棉体恤国潮短袖男T恤青少年学生大码宽松半袖潮流</div>
		<div class="detail__info__item">
			<span class="detail__info__name">价格： </span>
			<span class="detail__info__price"><span>￥<b>238</b></span><small>￥599</small></span>
		</div>
		<div class="detail__info__item">
			<span class="detail__info__name">颜色：</span>
			<div class="detail__info__item__main">
				<span>黑</span>
				<span>白</span>
				<span>红</span>
				<span>绿</span>
				<span>蓝</span>
				<span>紫</span>
			</div>
		</div>
		<div class="detail__info__item">
			<span class="detail__info__name">尺码：</span>
			<div class="detail__info__item__main">
				<span>S</span>
				<span>M</span>
				<span>L</span>
				<span>XL</span>
				<span>2XL</span>
				<span>3XL</span>
			</div>
		</div>
		<div class="detail__info__count">
			<span class="detail__info__name">数量：</span>
			<span class="detail__info__count__input">
	            <span class="detail__info__count__input--del">-</span>
	            <input id="goodsCount" type="text" value="1" maxlength="8" title="请输入购买量">
	            <span class="detail__info__count__input--add">+</span>
	        </span>
			<em>件(库存288件)</em>
		</div>
		<div class="detail__info__btns">
			<span class="detail__info__btns__btn">立即购买</span>
			<span class="detail__info__btns__btn"><span class="glyphicon glyphicon-shopping-cart"></span>加入购物车</span>
		</div>
		<p class="detail__info__tip">温馨提示：支持7天无理由退货</p>
	</div>
</div>

<div class="block commentadd-main">
	<textarea placeholder="请输入评论"></textarea>
	<span class="commentadd">添加评论</span>
</div>

<%@ include file="./public/comment-list.jsp"%>

<script>
	$(function() {
		
	});
</script>

<%@ include file="../public/footer.jsp"%>
