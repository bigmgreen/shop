<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="../public/taglibs.jsp"%>

<c:set var="pageId" scope="session" value="${3}"/>

<%@ include file="./public/header.jsp"%>

<div class="row">
	<div class="col-md-12 col-sm-12">
		<div class="panel panel-info">
			<div class="panel-heading">
			  <h3 class="panel-title">焦点图</h3>
			</div>
			<div class="panel-body">
				<c:if test="${list ne null }">
					<table class="table table-hover">
				      <thead>
				        <tr>
				          <th>更新日期</th>
				          <th>图片预览</th>
				          <th>商品名称</th>
				          <th>删除</th>
				        </tr>
				      </thead>
				      <tbody>
				      	<c:forEach items="${banner}" var="item" varStatus="status">
					        <tr>
					          <th><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${item.date }" type="both"/></th>
					          <td><img width="150" height="81" src="<c:out value="${item.imgurl }"></c:out>" /></td>
					          <td><c:out value="${item.title }"></c:out></td>
					          <td data-id="<c:out value="${item.id }"></c:out>">
								  <button type="button" data-banner-del class="btn btn-danger">删除</button>
					          </td>
					        </tr>
				        </c:forEach>
				      </tbody>
				    </table>
				</c:if>
			    <c:if test="${list eq null}"><p class="empty"><i>暂无数据</i></p></c:if>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-md-12 col-sm-12">
		<div class="panel panel-info">
			<div class="panel-heading">
			  <h3 class="panel-title">在售商品</h3>
			</div>
			<div class="panel-body">
				<div class="btn-group pull-right">
				  <button type="button" class="btn btn-primary btn-lg">添加</button>
				</div>
				<c:if test="${list ne null }">
					<table class="table table-hover">
				      <thead>
				        <tr>
				          <th>上架日期</th>
				          <th>商品名称</th>
				          <th>是否包邮</th>
				          <th>现价</th>
				          <th>原价</th>
				          <th>库存</th>
				          <th>类型</th>
				          <th width="230">操作</th>
				        </tr>
				      </thead>
				      <tbody>
				      	<c:forEach items="${list}" var="item" varStatus="status">
					        <tr>
					          <th><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${item.date }" type="both"/></th>
					          <td><c:out value="${item.title }"></c:out></td>
					          <td><c:out value="${item.ispost eq 0 ? '不' : '' }"></c:out>包邮</td>
					          <td>￥<c:out value="${item.price }"></c:out></td>
					          <td>￥<c:out value="${item.oldprice }"></c:out></td>
					          <td>x<c:out value="${item.salecount }"></c:out></td>
					          <td>
					          	<c:choose>
					          		<c:when test="${item.type eq 1 }">男裤</c:when>
					          		<c:when test="${item.type eq 2 }">女裤</c:when>
					          		<c:when test="${item.type eq 3 }">男鞋</c:when>
					          		<c:when test="${item.type eq 4 }">女鞋</c:when>
					          	</c:choose>
					          </td>
					          <td data-id="<c:out value="${item.id }"></c:out>">
								  <button type="button" data-banner class="btn btn-info">设为焦点图</button>
								  <button type="button" data-update class="btn btn-success">修改</button>
								  <button type="button" data-del class="btn btn-danger">删除</button>
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

<div class="modal fade" id="bannerDelModal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">提示</h4>
      </div>
      <div class="modal-body">确认删除这个焦点图？</div>
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
      <div class="modal-body">确认删除这个商品？</div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary">确认</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="bannerModal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">设置焦点图</h4>
      </div>
      <div class="modal-body">
      	<form>
			<div class="row">
				<div class="col-sm-12">
					<div class="form-group">
						<label for="bannerimgurl">图片地址</label>
						<input id="bannerimgurl" class="form-control" placeholder="请输入图片地址">
						<p class="text-danger">图片尺寸为： 520 * 280</p>
					</div>
				</div>
			</div>
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary">确认</button>
      </div>
    </div>
  </div>
</div>

<script>
	$(function() {
		$('[data-banner-del]').click(function(){
			$('#bannerDelModal').find('.btn-primary').attr('data-id', $(this).parent().data('id'));
			$('#bannerDelModal').modal();
		});
		
		$('#bannerDelModal').find('.btn-primary').click(function() {
			
			$(this).attr('disabled', true);
			var self = this;
			
			$.post('/admin/goodsbannerdel.admin', {
				id: $(this).attr('data-id')
			}).done(function (res) {
				if (res.code === 0) {
					location.reload();
				}
			}).complete(function (res) {
				$('#bannerDelModal').modal('hide');
				complete(res, $(self));
			});
		});
	});
</script>

<script>
	$(function() {
		var banner = $('#bannerimgurl');
		
		$('[data-banner]').click(function(){
			$('#bannerModal').find('.btn-primary').attr('data-id', $(this).parent().data('id'));
			$('#bannerModal').modal();
		});
		
		$('#bannerModal').find('.btn-primary').click(function() {
			
			if (banner.val() === '') { return; }
			
			$(this).attr('disabled', true);
			var self = this;
			
			$.post('/admin/goodsbanner.admin', {
				id: $(this).attr('data-id'),
				imgurl: banner.val()
			}).done(function (res) {
				if (res.code === 0) {
					location.reload();
				}
			}).complete(function (res) {
				$('#bannerModal').modal('hide');
				complete(res, $(self));
			});
		});
	});
</script>

<script>
	$(function() {
		$('[data-del]').click(function(){
			$('#delModal').find('.btn-primary').attr('data-id', $(this).parent().data('id'));
			$('#delModal').modal();
		});
		
		$('#delModal').find('.btn-primary').click(function() {
			$(this).attr('disabled', true);
			var self = this;
			
			$.post('/admin/goodsdel.admin', {
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
<!-- <script>
	$(function() {
		$('[data-del]').click(function(){
			$('#delModal').find('.btn-primary').attr('data-id', $(this).parent().data('id'));
			$('#delModal').modal();
		});
		
		$('#delModal').find('.btn-primary').click(function() {
			var self = this;
			
			$.post('/admin/goodsdel.admin', {
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
</script> -->

<%@ include file="./public/footer.jsp"%>