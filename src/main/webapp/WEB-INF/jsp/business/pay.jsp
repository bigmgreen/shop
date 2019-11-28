<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="./public/header.jsp"%>

<link href="/static/css/pay.css" rel="stylesheet" type="text/css" media="all" />

<div class="pay block">
	<div class="pay__list">
		<div class="pay__list__head">
			<span>商品信息</span>
			<span>数量</span>
			<span>金额</span>
		</div>
		<div class="pay__list__item">
			<div class="pay__list__item__main">
				<img class="pay__list__item__main__img" src="//img.alicdn.com/imgextra/i2/3485517560/O1CN01mmDQGw25iWpCMKsot_!!3485517560.jpg_80x80.jpg" />
				<b class="pay__list__item__main__title"><c:out value="${goods.title }"></c:out></b>
				<b class="pay__list__item__main__desc">颜色分类：<c:out value="${color }"></c:out><br>尺寸：<c:out value="${size}"></c:out></b>
				<span class="pay__list__item__main__count">x<c:out value="${count }"></c:out></span>
				<span class="pay__list__item__main__price">￥<c:out value="${goods.price}"></c:out></span>
			</div>
		</div>
	</div>
</div>

<div class="pay-warp block">
	<span class="pay__txt">合计（不含运费）<b><c:out value="${goods.price}"></c:out></b>元</span>
	
	<button type="button" id="buy" class="pay__btn active">结算</button>
</div>

<div class="modal fade" id="buyModal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">提示</h4>
      </div>
      <div class="modal-body">下单成功！店家正在发货中...<br>可到【我的订单】查看最新订单情况~</div>
      <div class="modal-footer">
        <a href="/shop/orders.user" class="btn btn-primary">查订单</a>
      </div>
    </div>
  </div>
</div>

<script>
	$(function() {
		$('#buy').click(function(){
			$(this).attr('disabled', true);
			var self = this;
			$.post('/shop/buy.user', {
				goodsid: '<c:out value="${goods.id}"></c:out>',
				count: '<c:out value="${count }"></c:out>',
				color: '<c:out value="${color }"></c:out>',
				size: '<c:out value="${size}"></c:out>'
			}).done(function (res) {
				if (res.code === 0) {
					$('#buyModal').modal();
				}
			}).complete(function (res) {
				complete(res, $(self));
			});
		});
	});
</script>

<%@ include file="./public/footer.jsp"%>