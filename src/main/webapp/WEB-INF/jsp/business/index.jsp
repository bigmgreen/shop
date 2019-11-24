<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="../public/header.jsp"%>

<link href="/static/css/index.css" rel="stylesheet" type="text/css" media="all" />

<div class="focus block">
	<div class="banner">
		<div class="carousel slide" id="carousel" data-ride="carousel">
		  <ol class="carousel-indicators">
		  	<c:forEach items="${banner}" var="item" varStatus="status">
			    <li 
				    data-target="#carousel" 
				    data-slide-to="${status.index}" 
				    class="<c:if test="${status.index == 0}">active</c:if>"
			    ></li>
		    </c:forEach>
		  </ol>

		  <div class="carousel-inner" role="listbox">
		    <c:forEach items="${banner}" var="item" varStatus="status">
		    	<a 
		    		href='/shop/detail.html?id=<c:out value="${item.goodsid }"></c:out>' 
		    		class="item <c:if test="${status.index == 0}">active</c:if>"
		    	>
			      <img src='<c:out value="${item.imgurl }"></c:out>'>
			    </a>
		    </c:forEach>
		  </div>
		
		  <a class="left carousel-control" href="#carousel" role="button" data-slide="prev">
		    <span class="glyphicon glyphicon-chevron-left"></span>
		    <span class="sr-only">前一个</span>
		  </a>
		  <a class="right carousel-control" href="#carousel" role="button" data-slide="next">
		    <span class="glyphicon glyphicon-chevron-right"></span>
		    <span class="sr-only">下一个</span>
		  </a>
		</div>
	</div>
	<div class="goods--small__list">
		<c:forEach items="${hotlist}" var="item" varStatus="status">
	    	<a href='/shop/detail.html?id=<c:out value="${item.id }"></c:out>' class="goods--small">
				<img src="<c:out value="${item.imgurl }"></c:out>" />
				<span><c:out value="${item.title }"></c:out></span>
				<em><i>￥</i><c:out value="${item.price }"></c:out></em>
			</a>
	    </c:forEach>
	</div>
</div>

<div class="block">
	<h3>热卖单品<a class="more pull-right" href="/shop/list.html">更多&gt;&gt;</a></h3>
</div>

<%@ include file="./public/goods-list.jsp"%>

<c:if test="${list != null}"><div class="end"><i>END</i></div></c:if>

<%@ include file="../public/footer.jsp"%>
