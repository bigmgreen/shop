<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="../public/taglibs.jsp"%>

<c:set var="pageId" scope="session" value="${1}"/>

<%@ include file="./public/header.jsp"%>

<div class="row">
	<div class="col-md-12 col-sm-12">
		<div class="panel panel-info">
			<div class="panel-heading">
			  <h3 class="panel-title">商品订单<a href="/admin/orders.admin" class="pull-right">更多&gt;&gt;</a></h3>
			</div>
			<div class="panel-body">
				<c:if test="${oders ne null }">
					<table class="table table-hover">
				      <thead>
				        <tr>
				          <th>下单日期</th>
				          <th>订单号</th>
				          <th>商品名称</th>
				          <th>商品总价</th>
				          <th>商品数量</th>
				          <th>下单用户</th>
				        </tr>
				      </thead>
				      <tbody>
				      	<c:forEach items="${oders}" var="item" varStatus="status">
					        <tr>
					          <th><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${item.date }" type="both"/></th>
					          <td><c:out value="${item.ordercode }"></c:out></td>
					          <td><c:out value="${item.title }"></c:out></td>
					          <td><c:out value="${item.price }"></c:out></td>
					          <td><c:out value="${item.count }"></c:out></td>
					          <td><c:out value="${item.username }"></c:out></td>
					        </tr>
				        </c:forEach>
				      </tbody>
				    </table>
				</c:if>
			    <c:if test="${oders eq null}"><p class="empty"><i>暂无数据</i></p></c:if>
			</div>
		</div>
	</div>
	<div class="col-md-12 col-sm-12">
		<div class="panel panel-info">
			<div class="panel-heading">
			  <h3 class="panel-title">商品评价<a href="/admin/comments.admin" class="pull-right">更多&gt;&gt;</a></h3>
			</div>
			<div class="panel-body">
			  	<c:if test="${comments ne null }">
					<table class="table table-hover">
				      <thead>
				        <tr>
				          <th>评论日期</th>
				          <th>商品id</th>
				          <th>评论用户</th>
				          <th>评论内容</th>
				        </tr>
				      </thead>
				      <tbody>
				      	<c:forEach items="${comments}" var="item" varStatus="status">
					        <tr>
					          <th><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${item.date }" type="both"/></th>
					          <td><c:out value="${item.goodsid }"></c:out></td>
					          <td><c:out value="${item.username }"></c:out></td>
					          <td><span class="nowrap"><c:out value="${item.txt }"></c:out></span></td>
					        </tr>
				        </c:forEach>
				      </tbody>
				    </table>
				</c:if>
			    <c:if test="${comments eq null}"><p class="empty"><i>暂无数据</i></p></c:if>
			</div>
		</div>
	</div>
	<div class="col-md-12 col-sm-12">
		<div class="panel panel-info">
			<div class="panel-heading">
			  <h3 class="panel-title">在售商品<a href="/admin/goodses.admin" class="pull-right">更多&gt;&gt;</a></h3>
			</div>
			<div class="panel-body">
			  	<c:if test="${goodses ne null }">
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
				        </tr>
				      </thead>
				      <tbody>
				      	<c:forEach items="${goodses}" var="item" varStatus="status">
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
					        </tr>
				        </c:forEach>
				      </tbody>
				    </table>
				</c:if>
			    <c:if test="${goodses eq null}"><p class="empty"><i>暂无数据</i></p></c:if>
			</div>
		</div>
	</div>
	<div class="col-md-12 col-sm-12">
		<div class="panel panel-info">
			<div class="panel-heading">
			  <h3 class="panel-title">注册用户<a href="/admin/users.admin" class="pull-right">更多&gt;&gt;</a></h3>
			</div>
			<div class="panel-body">
			  	<c:if test="${users ne null }">
					<table class="table table-hover">
				      <thead>
				        <tr>
				          <th>注册日期</th>
				          <th>用户名</th>
				          <th>邮箱</th>
				          <th>地址</th>
				          <th>邮编</th>
				        </tr>
				      </thead>
				      <tbody>
				      	<c:forEach items="${users}" var="item" varStatus="status">
					        <tr>
					          <th><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${item.date }" type="both"/></th>
					          <td><c:out value="${item.name }"></c:out></td>
					          <td><c:out value="${item.email }"></c:out></td>
					          <td><c:out value="${item.address }"></c:out></td>
					          <td><c:out value="${item.postelcode }"></c:out></td>
					        </tr>
				        </c:forEach>
				      </tbody>
				    </table>
				</c:if>
			    <c:if test="${users eq null}"><p class="empty"><i>暂无数据</i></p></c:if>
			</div>
		</div>
	</div>
</div>

<%@ include file="./public/footer.jsp"%>