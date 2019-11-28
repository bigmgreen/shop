<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="../public/taglibs.jsp"%>

<c:set var="pageId" scope="session" value="${5}"/>

<%@ include file="./public/header.jsp"%>

<div class="row">
	<div class="col-md-12 col-sm-12">
		<div class="panel panel-info">
			<div class="panel-heading">
			  <h3 class="panel-title">商品订单</h3>
			</div>
			<div class="panel-body">
				<c:if test="${list ne null }">
					<table class="table table-hover">
				      <thead>
				        <tr>
				          <th>下单日期</th>
				          <th>订单号</th>
				          <th>商品名称</th>
				          <th>商品总价</th>
				          <th>商品数量</th>
				          <th>下单用户</th>
				          <th>状态</th>
				          <th>操作</th>
				        </tr>
				      </thead>
				      <tbody>
				      	<c:forEach items="${list}" var="item" varStatus="status">
					        <tr>
					          <th><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${item.date }" type="both"/></th>
					          <td><c:out value="${item.ordercode }"></c:out></td>
					          <td><c:out value="${item.title }"></c:out></td>
					          <td><c:out value="${item.price }"></c:out></td>
					          <td><c:out value="${item.count }"></c:out></td>
					          <td><c:out value="${item.username }"></c:out></td>
					          <td>
					          	<c:choose>
					          		<c:when test="${item.type eq -1 }"><span class="text-muted">已失效</span></c:when>
					          		<c:when test="${item.type eq 1 }"><span class="text-primary">待发货</span></c:when>
					          		<c:when test="${item.type eq 2 }"><span class="text-info">待收货</span></c:when>
					          		<c:when test="${item.type eq 3 }"><span class="text-success">已收货</span></c:when>
					          	</c:choose>
							  </td>
					          <td>
					          	<!-- 1待发货 2待收货 3 已收货 -->
					          	<c:if test="${item.type eq 1 }"><button type="button" class="btn btn-primary" data-orderupdate data-id="<c:out value="${item.id }"></c:out>">发货</button></c:if>
							  </td>
					        </tr>
				        </c:forEach>
				      </tbody>
				    </table>
				</c:if>
			    <c:if test="${list eq null}"><p class="empty"><i>暂无数据</i></p></c:if>

				<c:if test="${pageCount > 0 }">
					<nav class="pull-right">
					  <ul class="pagination">
					  	<c:forEach var="count" begin="1" end="${pageCount }">
					  	    <li class='<c:if test="${pageIndex eq count}">active</c:if>'>
					  	    	<a href="?pageIndex=<c:out value="${count }"></c:out>"><c:out value="${count }"></c:out></a>
					  	    </li>
					  	</c:forEach>
					  </ul>
					</nav>
				</c:if>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="goodsModal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">提示</h4>
      </div>
      <div class="modal-body">确认发货？</div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary">确认</button>
      </div>
    </div>
  </div>
</div>

<script>
	$(function() {
		$('[data-orderupdate]').click(function(){
			$('#goodsModal').find('.btn-primary').attr('data-id', $(this).data('id'));
			$('#goodsModal').modal();
		});
		
		$('#goodsModal').find('.btn-primary').click(function() {
			var self = this;
			
			$.post('/admin/orderupdate.admin', {
				id: $(this).attr('data-id')
			}).done(function (res) {
				if (res.code === 0) {
					location.reload();
				}
			}).complete(function (res) {
				$('#goodsModal').modal('hide');
				complete(res, $(self));
			});
		});
	});
</script>

<%@ include file="./public/footer.jsp"%>