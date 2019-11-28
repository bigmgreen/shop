<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="../public/taglibs.jsp"%>

<c:set var="pageId" scope="session" value="${2}"/>

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
				          <th>注册日期</th>
				          <th>用户名</th>
				          <th>邮箱</th>
				          <th>地址</th>
				          <th>邮编</th>
				          <th width="140">操作</th>
				        </tr>
				      </thead>
				      <tbody>
				      	<c:forEach items="${list}" var="item" varStatus="status">
					        <tr>
					          <th><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${item.date }" type="both"/></th>
					          <td><c:out value="${item.name }"></c:out></td>
					          <td><c:out value="${item.email }"></c:out></td>
					          <td><c:out value="${item.address }"></c:out></td>
					          <td><c:out value="${item.postelcode }"></c:out></td>
					          <td>
					          	<button 
						          	type="button" 
						          	class="btn btn-default"
						          	data-detail
						          	data-name="<c:out value="${item.name }"></c:out>"
						            data-email="<c:out value="${item.email }"></c:out>"
						            data-postelcode="<c:out value="${item.postelcode }"></c:out>"
						            data-address="<c:out value="${item.address }"></c:out>"
					          	>详情</button>
					          	<button type="button" class="btn btn-danger" data-del data-id="<c:out value="${item.id }"></c:out>">删除</button>
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

<div class="modal fade" id="detailModal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">用户详情</h4>
      </div>
      <div class="modal-body">
      	<form>
			<div class="row">
				<div class="col-sm-12">
					<div class="form-group">
						<label for="name">用户名</label>
						<input id="name" class="form-control" readonly="readonly" disabled="disabled">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-12">
					<div class="form-group">
						<label for="email">邮箱</label>
						<input id="email" class="form-control" readonly="readonly" disabled="disabled">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-12">
					<div class="form-group">
						<label for="postelcode">邮编</label>
						<input id="postelcode" class="form-control" readonly="readonly" disabled="disabled" placeholder="请输入邮编">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-12">
					<div class="form-group">
						<label for="address">地址</label>
						<input id="address" class="form-control" readonly="readonly" disabled="disabled">
					</div>
				</div>
			</div>
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
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
      <div class="modal-body">确认删除这个用户？</div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary">确认</button>
      </div>
    </div>
  </div>
</div>

<script>
	$(function() {
		$('[data-detail]').click(function(){
			$('#detailModal').find('#name').val($(this).data('name'));
			$('#detailModal').find('#email').val($(this).data('email'));
			$('#detailModal').find('#postelcode').val($(this).data('postelcode'));
			$('#detailModal').find('#address').val($(this).data('address'));
			$('#detailModal').modal();
		});
		
		$('[data-del]').click(function(){
			$('#delModal').find('.btn-primary').attr('data-id', $(this).data('id'));
			$('#delModal').modal();
		});
		
		$('#delModal').find('.btn-primary').click(function() {
			var self = this;
			
			$.post('/admin/userdel.admin', {
				id: $(this).attr('data-id')
			}).done(function (res) {
				if (res.code === 0) {
					location.reload();
				}
			}).complete(function (res) {
				$('#delModal').modal('hide');
				complete(res, $(self));
			});
		});
	});
</script>

<%@ include file="./public/footer.jsp"%>