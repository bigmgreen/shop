<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="./public/header.jsp"%>

<link href="/static/css/carlist.css" rel="stylesheet" type="text/css" media="all" />

<c:if test="${list != null}">
	<div class="carlist block">
		<div class="carlist__list">
			<div class="carlist__list__head">
				<span><label><input type="checkbox" id="all">全选</label></span>
				<span>商品信息</span>
				<span>数量</span>
				<span>金额</span>
				<span>操作</span>
			</div>
			
			<c:forEach items="${list}" var="item" varStatus="status">
		    	<div class="carlist__list__item">
					<div class="carlist__list__item__main">
						<input type="checkbox" data-checkbox data-id="<c:out value="${item.id }"></c:out>">
						<img class="carlist__list__item__main__img" src="<c:out value="${item.imgurl }"></c:out>" />
						<b class="carlist__list__item__main__title"><c:out value="${item.title }"></c:out></b>
						<b class="carlist__list__item__main__desc">颜色分类：<c:out value="${item.color }"></c:out><br>尺码：<c:out value="${item.size }"></c:out></b>
						<span class="carlist__list__item__main__count" data-count="<c:out value="${item.count }"></c:out>">x<c:out value="${item.count }"></c:out></span>
						<span class="carlist__list__item__main__price" data-price="<c:out value="${item.price }"></c:out>">￥<c:out value="${item.price }"></c:out></span>
						<span class="carlist__list__item__main__del" data-id="<c:out value="${item.id }"></c:out>">删除</span>
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
		  	    	<a href="/shop/carlist.user?pageSize=<c:out value="${pageSize }"></c:out>&pageIndex=<c:out value="${count }"></c:out>"><c:out value="${count }"></c:out></a>
		  	    </li>
		  	</c:forEach>
		  </ul>
		</nav>
	</div>
</c:if>

<c:if test="${list != null}">
	<div class="pay block">
		<span class="pay__txt">已选商品<b id="count">0</b>件</span>
		<span class="pay__txt">合计（不含运费）<b id="price">0.00</b>元</span>
		<div id="buy" class="pay__btn active">结算</div>
	</div>
</c:if>

<div class="modal fade" id="delModal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">提示</h4>
      </div>
      <div class="modal-body">确认删除这条记录？</div>
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
      <div class="modal-body">确认删除这条记录？</div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary">确认</button>
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

<script>
	$(function() {
		$('.carlist__list__item__main__del').click(function(){
			$('#delModal').find('.btn-primary').attr('data-id', $(this).data('id'));
			$('#delModal').modal();
		});
		
		$('#delModal').find('.btn-primary').click(function() {
			$.post('/shop/cardel.user', {
				id: $(this).attr('data-id')
			}).done(function (res) {
				if (res.code === 0) {
					location.reload();
				}
			}).complete(function (res) {
				$('#delModal').hide();
				complete(res, $(self));
			});
		});
		
		$('#buy').click(function (){
			var ids = $('[data-checkbox]:checked').map(function() {
				return $(this).data('id');
			});
			if (ids.length === 0) { return; }
			
			$.post('/shop/carbuy.user', { ids: [].join.call(ids, ',') }).done(function (res) {
				if (res.code === 0) {
					$('#buyModal').modal();
				}
			}).complete(function (res) {
				$('#buyModal').hide();
				complete(res, $(self));
			});
		});
		
		function setTotal() {
			var count = 0;
			var price = 0;
			$('[data-checkbox]:checked').map(function(){
				count += Number($(this).siblings('[data-count]').data('count'));
				price += Number($(this).siblings('[data-price]').data('price'));
			});
			
			$('#count').html(count);
			$('#price').html(price);
		}
		
		$('[data-checkbox]').change(function() {
			setTotal();
			
			if ($('[data-checkbox]').length === $('[data-checkbox]:checked').length) {
				$('#all').prop('checked', true);		
			} else {
				$('#all').prop('checked', false);
			}
		});
		
		$('#all').change(function() {
			if ($(this).prop('checked')) {
				$('[data-checkbox]').prop('checked', true);
			} else {
				$('[data-checkbox]').prop('checked', false);
			}
			
			setTotal();
		});
	});
</script>

<%@ include file="./public/footer.jsp"%>
