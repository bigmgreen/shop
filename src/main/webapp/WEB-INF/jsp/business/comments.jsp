<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="../public/header.jsp"%>

<%@ include file="./public/comment-list.jsp"%>

<c:if test="${list == null}"><p class="empty"><i>暂无评论</i></p></c:if>

<c:if test="${pageCount > 0 }">
	<div class="block">
		<nav class="pull-right">
		  <ul class="pagination">
		  	<c:forEach var="count" begin="1" end="${pageCount }">
		  	    <li class='<c:if test="${pageIndex eq count}">active</c:if>'>
		  	    	<a href="/shop/comments.html?goodsId=<c:out value="${goodsId }"></c:out>&pageSize=<c:out value="${pageSize }"></c:out>&pageIndex=<c:out value="${count }"></c:out>"><c:out value="${count }"></c:out></a>
		  	    </li>
		  	</c:forEach>
		  </ul>
		</nav>
	</div>
</c:if>

<%@ include file="../public/footer.jsp"%>
