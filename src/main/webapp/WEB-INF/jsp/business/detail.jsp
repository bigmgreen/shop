<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="../public/header.jsp"%>

<link href="/static/css/detail.css" rel="stylesheet" type="text/css" media="all" />

<div class="detail block">
	<div class="detail__preview">
		<img class="detail__preview__img" src='<c:out value="${goods.imgurl }"></c:out>' />
		
		<div class="detail__preview__imgs">
			<span><img data-preview src='<c:out value="${goods.imgurl }"></c:out>' /></span>
			<c:forEach items="${goods.imgs}" var="item"><span><img data-preview src="<c:out value="${item}"></c:out>" /></span></c:forEach>
		</div>
	</div>
	<div class="detail__info">
		<div class="detail__info__title"><c:out value="${goods.title}"></c:out></div>
		<div class="detail__info__item">
			<span class="detail__info__name">价格： </span>
			<span class="detail__info__price"><span>￥<b><c:out value="${goods.price}"></c:out></b></span><small>￥<c:out value="${goods.oldprice}"></c:out></small></span>
		</div>
		<div class="detail__info__item">
			<span class="detail__info__name">颜色：</span>
			<div class="detail__info__item__main" data-colors>
				<c:forEach items="${goods.colors}" var="item"><span><c:out value="${item}"></c:out></span></c:forEach>
			</div>
		</div>
		<div class="detail__info__item">
			<span class="detail__info__name">尺码：</span>
			<div class="detail__info__item__main" data-sizes>
				<c:forEach items="${goods.sizes}" var="item"><span><c:out value="${item}"></c:out></span></c:forEach>
			</div>
		</div>
		<div class="detail__info__count">
			<span class="detail__info__name">数量：</span>
			<span class="detail__info__count__input">
	            <span class="detail__info__count__input--del">-</span>
	            <input id="goodsCount" type="text" value="1" maxlength="8" title="请输入购买量">
	            <span class="detail__info__count__input--add" data-max="<c:out value="${goods.count}"></c:out>">+</span>
	        </span>
			<em>件(库存<c:out value="${goods.count}"></c:out>件)</em>
		</div>
		<div class="detail__info__btns">
			<button id="buy" type="button" class="detail__info__btns__btn">立即购买</button>
			<button id="car" type="button" class="detail__info__btns__btn"><span class="glyphicon glyphicon-shopping-cart"></span>加入购物车</button>
		</div>
		<p class="detail__info__tip">温馨提示：支持7天无理由退货</p>
	</div>
</div>

<div class="block commentadd-main">
	<textarea placeholder="请输入评论"></textarea>
	<span class="commentadd">添加评论</span>
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

<div class="modal fade" id="carModal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">提示</h4>
      </div>
      <div class="modal-body">加入购物车成功~</div>
      <div class="modal-footer">
        <a href="/shop/carlist.user" class="btn btn-primary">购物车</a>
      </div>
    </div>
  </div>
</div>

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

<%@ include file="./public/comment-list.jsp"%>

<script>
	function complete(res, btn) {
		if (res.status !== 200) {
			$('#errorModal').modal();
		} else if (res.responseText.indexOf('欢迎登录') !== -1) {
			$('#loginModal').modal();
		}
		
		btn.attr('disabled', false);
	}
	
	$(function() {
		var count = $('#goodsCount');
		$('.detail__info__count__input--del').click(function () {
			var val = count.val();
			val--;
			if (val === 0) {
				val = 1;
			}
			count.val(val);
		});
		$('.detail__info__count__input--add').click(function () {
			var max = Number($(this).data('max')) || 99;
			var val = count.val();
			val++;
			if (val >= max) {
				val = max;
			}
			count.val(val);
		});
		
		var preview = $('.detail__preview__img');
		$('[data-preview]').mouseenter(function () {
			preview.attr('src', $(this).attr('src'));
			$(this).parents('.detail__preview__imgs').find('.active').removeClass('active');
			$(this).addClass('active');
		});
		
		$('[data-colors]').find('span').click(function () {
			$('[data-colors]').attr('data-color', $(this).html());	
			$(this).parent().find('.active').removeClass('active');
			$(this).addClass('active');
		});
		
		$('[data-sizes]').find('span').click(function () {
			$('[data-sizes]').attr('data-sizes', $(this).html());
			$(this).parent().find('.active').removeClass('active');
			$(this).addClass('active');
		});
		
		setTimeout(function () {
			$('[data-sizes]').find('span').first().click();
			$('[data-colors]').find('span').first().click();
		});
		
		$('#buy').click(function(){
			$(this).attr('disabled', true);
			var self = this;
			$.post('/shop/buy.user', {
				goodsid: '${goods.id}',
				count: count.val(),
				color: $('[data-colors]').attr('data-color'),
				size: $('[data-sizes]').attr('data-sizes')
			}).done(function (res) {
				if (res.code === 0) {
					$('#buyModal').modal();
				}
			}).complete(function (res) {
				complete(res, $(self));
			});
		});
		
		$('#car').click(function(){
			$(this).attr('disabled', true);
			var self = this;
			$.post('/shop/addcar.user', {
				goodsid: '${goods.id}',
				count: count.val(),
				color: $('[data-colors]').attr('data-color'),
				size: $('[data-sizes]').attr('data-sizes')
			}).done(function (res) {
				if (res.code === 0) {
					$('#carModal').modal();
				}
			}).complete(function (res) {
				complete(res, $(self));
			});
		});
	});
</script>

<%@ include file="../public/footer.jsp"%>
