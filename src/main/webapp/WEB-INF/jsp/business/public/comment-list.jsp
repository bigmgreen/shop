<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>

<link href="/static/css/comment.css" rel="stylesheet" type="text/css" media="all" />

<c:if test="${list != null}">
	<div class="comments block">
		<c:forEach items="${list}" var="item" varStatus="status">
	  	    <span class="comments__item">
				<span class="comments__item__author pull-left"><c:out value="${item.username }"></c:out> 说：</span>
				<span class="pull-left">
					<span class="comments__item__content">${item.txt }</span>
					<span class="comments__item__date pull-right">
						<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${item.date }" type="both"/>
						<c:if test="${user.id eq item.userid }"><em data-del data-id="<c:out value="${item.id }"></c:out>">删除</em></c:if>
						<em data-reply data-id="<c:out value="${item.id }"></c:out>">回复</em>
					</span>
				</span>
			</span>
	  	</c:forEach>
	</div>
</c:if>

<div class="modal fade" id="delModal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">提示</h4>
      </div>
      <div class="modal-body">确认删除您的这条评论？</div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary">确认</button>
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
		
		$('.comments__item__date [data-del]').click(function(){
			$('#delModal').find('.btn-primary').attr('data-id', $(this).data('id'));
			$('#delModal').modal();
		});
		
		$('#delModal').find('.btn-primary').click(function() {
			$.post('/shop/commentdel.user', {
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
		
		$('.comments__item__date [data-reply]').click(function(){
			$('#replyModal').find('.btn-primary').attr('data-id', $(this).data('id'));
			$('#replyModal').modal();
		});
		
		$('#replyModal').find('.btn-primary').click(function() {
			if (replyComment.val() === '') { return; }
			
			$(this).attr('disabled', true);
			var self = this;
			
			$.post('/shop/commentappend.user', {
				id: $(this).attr('data-id'),
				txt: replyComment.val()
			}).done(function (res) {
				if (res.code === 0) {
					location.reload();
				}
			}).complete(function (res) {
				$('#replyModal').modal('hide');
				complete(res, $(self));
			});
		});
	});
</script>