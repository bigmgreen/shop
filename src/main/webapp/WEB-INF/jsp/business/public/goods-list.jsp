<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="../../public/taglibs.jsp"%>

<link href="/static/css/goods.css" rel="stylesheet" type="text/css" media="all" />

<c:if test="${list != null}">
	<div class="list block">
		<c:forEach items="${list}" var="item" varStatus="status">
			<a href='/shop/detail.html?id=<c:out value="${item.id }"></c:out>' class="item">
				<img src="<c:out value="${item.imgurl }"></c:out>" />
				<span class="item__title">
					<c:if test="${item.ispost eq 1}"><img src="/static/img/goods/icon-baoyou.png" alt="" /></c:if>
					<c:out value="${item.title }"></c:out>
				</span>
				<span class="item__price">
					<span class="pull-left">￥<b><c:out value="${item.price }"></c:out></b><small>￥<c:out value="${item.oldprice }"></c:out></small></span>
					<span class="pull-right">月销<em><c:out value="${item.salecount }"></c:out></em>笔</span>
				</span>
			</a>
	    </c:forEach>
	</div>
</c:if>

<c:if test="${list == null}"><p class="empty"><i>暂无数据</i></p></c:if>