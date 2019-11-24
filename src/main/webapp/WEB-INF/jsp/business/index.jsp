<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="../public/header.jsp"%>

<link href="/static/css/index.css" rel="stylesheet" type="text/css" media="all" />

<div class="focus block">
	<div class="banner">
		<div class="carousel slide" id="carousel" data-ride="carousel">
		  <ol class="carousel-indicators">
		    <li data-target="#carousel" data-slide-to="0" class="active"></li>
		    <li data-target="#carousel" data-slide-to="1"></li>
		    <li data-target="#carousel" data-slide-to="2"></li>
		  </ol>
		

		  <div class="carousel-inner" role="listbox">
		    <div class="item active">
		      <img src="//img.alicdn.com/tfs/TB1vbTkna61gK0jSZFlXXXDKFXa-520-280.jpg_q90_.webp">
		      <div class="carousel-caption"></div>
		    </div>
		    <div class="item">
		      <img src="https://img.alicdn.com/simba/img/TB15q1AmYY1gK0jSZTESutDQVXa.jpg">
		      <div class="carousel-caption"></div>
		    </div>
		    <div class="item">
		      <img src="https://img.alicdn.com/simba/img/TB1XBHlhHvpK1RjSZFqSuwXUVXa.jpg">
		      <div class="carousel-caption"></div>
		    </div>
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
		<a href="#" class="goods--small">
			<img src="//img.alicdn.com/bao/uploaded/i1/106802831/TB2bMLgtFXXXXc6XXXXXXXXXXXX_!!106802831.jpg_180x180q90.jpg_.webp" />
			<span>冬宽松休闲外套大毛领连帽工装棉服男潮外套</span>
			<em><i>￥</i>289</em>
		</a>
		<a href="#" class="goods--small">
			<img src="//img.alicdn.com/bao/uploaded/i1/106802831/TB2bMLgtFXXXXc6XXXXXXXXXXXX_!!106802831.jpg_180x180q90.jpg_.webp" />
			<span>冬宽松休闲外套大毛领连帽工装棉服男潮外套</span>
			<em><i>￥</i>289</em>
		</a>
	</div>
</div>

<%@ include file="./public/goods-list.jsp"%>

<div class="end"><i>END</i></div>

<script>
	$(function() {
		
	});
</script>

<%@ include file="../public/footer.jsp"%>
