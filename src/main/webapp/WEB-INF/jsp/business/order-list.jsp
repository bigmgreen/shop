<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="../public/header.jsp"%>

<link href="/static/css/order-list.css" rel="stylesheet" type="text/css" media="all" />

<c:if test="${list != null}">
	<div class="orders block">
		<div class="orders__tab clearfix">
			<a href="/shop/orders.user?type=0&pageIndex=1" class="orders__tab__a <c:if test="${type == 0}">active</c:if>">所有订单</a>
			<a href="/shop/orders.user?type=1&pageIndex=1" class="orders__tab__a <c:if test="${type == 1}">active</c:if>">待发货</a>
			<a href="/shop/orders.user?type=2&pageIndex=1" class="orders__tab__a <c:if test="${type == 2}">active</c:if>">待收货</a>
			<a href="/shop/orders.user?type=3&pageIndex=1" class="orders__tab__a <c:if test="${type == 3}">active</c:if>">已收货</a>
		</div>
		
		<div class="orders__list">
			<div class="orders__list__head">
				<span>订单详情</span>
				<span>收货人</span>
				<span>金额</span>
				<span>状态</span>
				<span>操作</span>
			</div>
			<c:forEach items="${list}" var="item" varStatus="status">
		    	<div class="orders__list__item">
					<div class="orders__list__item--head">
						<div class="orders__list__item--head__date"><c:out value="${item.date }"></c:out></div>
						<div class="orders__list__item--head__number">订单号: <c:out value="${item.ordercode }"></c:out></div>
						<c:if test="${item.type == 3 }"><div class="orders__list__item--head__del" data-id="<c:out value="${item.id }"></c:out>">删除</div></c:if>
					</div>
					<div class="orders__list__item__main">
						<img class="orders__list__item__main__img" src="//img.alicdn.com/imgextra/i2/3485517560/O1CN01mmDQGw25iWpCMKsot_!!3485517560.jpg_80x80.jpg" />
						<b class="orders__list__item__main__title"><c:out value="${item.title }"></c:out></b>
						<span class="orders__list__item__main__count">x<c:out value="${item.count }"></c:out></span>
						<span class="orders__list__item__main__user"><c:out value="${item.username }"></c:out></span>
						<span class="orders__list__item__main__price">￥<c:out value="${item.price }"></c:out></span>
						<c:if test="${item.type == 1 }">
							<span class="orders__list__item__main__status">待发货</span>
						</c:if>
						<c:if test="${item.type == 2 }">
							<span class="orders__list__item__main__status">已发货</span>
							<span class="orders__list__item__main__do">
								<span class="orders__list__item__main__do__btn" data-id="<c:out value="${item.id }"></c:out>">确认收货</span>
							</span>
						</c:if>
						<c:if test="${item.type == 3 }">
							<span class="orders__list__item__main__status">已收货</span>
						</c:if>
					</div>
				</div>
	    	</c:forEach>
		</div>
	</div>
</c:if>

<c:if test="${list == null}"><p class="empty"><i>暂无数据</i></p></c:if>

<c:if test="${pageCount > 0 }">
	<div class="block">
		<nav class="pull-right">
		  <ul class="pagination">
		  	<c:forEach var="count" begin="1" end="${pageCount }">
		  	    <li class='<c:if test="${pageIndex eq count}">active</c:if>'>
		  	    	<a href="/shop/orders.user?type=<c:out value="${type }"></c:out>&pageSize=<c:out value="${pageSize }"></c:out>&pageIndex=<c:out value="${count }"></c:out>"><c:out value="${count }"></c:out></a>
		  	    </li>
		  	</c:forEach>
		  </ul>
		</nav>
	</div>
</c:if>

<div class="modal fade" id="goodsModal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">提示</h4>
      </div>
      <div class="modal-body">确认收货？</div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary">确认</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="delModal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">提示</h4>
      </div>
      <div class="modal-body">确认删除这条订单？</div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary">确认</button>
      </div>
    </div>
  </div>
</div>

<script>
	$(function() {
		$('.orders__list__item__main__do__btn').click(function(){
			$('#goodsModal').find('.btn-primary').attr('data-id', $(this).data('id'));
			$('#goodsModal').modal();
		});
		
		$('#goodsModal').find('.btn-primary').click(function() {
			$.post('/shop/orderupdate.user', {
				id: $(this).attr('data-id')
			}).done(function (res) {
				if (res.code === 0) {
					location.reload();
				}
			}).complete(function (res) {
				complete(res, $(self));
			});
		});
		
		$('.orders__list__item--head__del').click(function(){
			$('#delModal').find('.btn-primary').attr('data-id', $(this).data('id'));
			$('#delModal').modal();
		});
		
		$('#delModal').find('.btn-primary').click(function() {
			$.post('/shop/orderdel.user', {
				id: $(this).attr('data-id')
			}).done(function (res) {
				if (res.code === 0) {
					location.reload();
				}
			}).complete(function (res) {
				complete(res, $(self));
			});
		});
	});
</script>

<%@ include file="../public/footer.jsp"%>
