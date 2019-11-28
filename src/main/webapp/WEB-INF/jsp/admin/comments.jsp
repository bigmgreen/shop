<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="../public/taglibs.jsp"%>

<c:set var="pageId" scope="session" value="${4}"/>

<%@ include file="./public/header.jsp"%>

<div class="row">
	<div class="col-md-12 col-sm-12">
		<div class="panel panel-info">
			<div class="panel-heading">
			  <h3 class="panel-title">商品评论</h3>
			</div>
			<div class="panel-body">
				<c:if test="${list ne null }">
					<table class="table table-hover">
				      <thead>
				        <tr>
				          <th>评论日期</th>
				          <th>商品id</th>
				          <th>评论用户</th>
				          <th>评论内容</th>
				          <th>操作</th>
				        </tr>
				      </thead>
				      <tbody>
				      	<c:forEach items="${list}" var="item" varStatus="status">
					        <tr>
					          <th><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${item.date }" type="both"/></th>
					          <td><c:out value="${item.goodsid }"></c:out></td>
					          <td><c:out value="${item.username }"></c:out></td>
					          <td title="<c:out value="${item.txt }"></c:out>"><span class="nowrap"><c:out value="${item.txt }"></c:out></span></td>
					          <td><button 
						          	type="button" 
						          	class="btn btn-primary" 
						          	data-reply 
						          	data-id="<c:out value="${item.id }"></c:out>" 
						          	data-txt="<c:out value="${item.username }"></c:out> 说： <c:out value="${item.txt }"></c:out>"
					          	>回复</button></td>
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

<div class="modal fade" id="replyModal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">回复</h4>
      </div>
      <div class="modal-body">
      	<pre id="txt"></pre>
		<textarea id="replyCommentVal" placeholder="请输入您的回复"></textarea>
	  </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary">确认</button>
      </div>
    </div>
  </div>
</div>

<script>
	$(function () {
		var replyComment = $('#replyCommentVal');
		var txt = $('#txt');
		
		$('[data-reply]').click(function(){
			$('#replyModal').find('.btn-primary').attr('data-id', $(this).data('id'));
			txt.html($(this).data('txt'));
			$('#replyModal').modal();
		});
		
		$('#replyModal').find('.btn-primary').click(function() {
			if (replyComment.val() === '') { return; }
			
			$(this).attr('disabled', true);
			var self = this;
			
			$.post('/admin/commentappend.admin', {
				id: $(this).attr('data-id'),
				txt: replyComment.val()
			}).done(function (res) {
				if (res.code === 0) {
					location.reload();
				}
			}).complete(function (res) {
				$('#replyModal').modal('hide');
				txt.html('');
				complete(res, $(self));
			});
		});
	});
</script>

<%@ include file="./public/footer.jsp"%>