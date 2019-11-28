<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="../public/taglibs.jsp"%>

<c:set var="pageId" scope="session" value="${3}"/>

<%@ include file="./public/header.jsp"%>

<div class="row">
	<div class="col-md-12 col-sm-12">
		<div class="panel panel-info">
			<div class="panel-heading">
			  <h3 class="panel-title">注册用户</h3>
			</div>
			<div class="panel-body">
			  	<table class="table table-hover">
			      <thead>
			        <tr>
			          <th>#</th>
			          <th>First Name</th>
			          <th>Last Name</th>
			          <th>Username</th>
			        </tr>
			      </thead>
			      <tbody>
			        <tr>
			          <th scope="row">1</th>
			          <td>Mark</td>
			          <td>Otto</td>
			          <td>@mdo</td>
			        </tr>
			        <tr>
			          <th scope="row">2</th>
			          <td>Jacob</td>
			          <td>Thornton</td>
			          <td>@fat</td>
			        </tr>
			        <tr>
			          <th scope="row">3</th>
			          <td>Larry</td>
			          <td>the Bird</td>
			          <td>@twitter</td>
			        </tr>
			      </tbody>
			    </table>
			</div>
		</div>
	</div>
</div>

<%@ include file="./public/footer.jsp"%>