<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%@ include file="../../public/taglibs.jsp"%>

<div class="modal fade" id="addModal" tabindex="-1">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">商品添加</h4>
      </div>
      <div class="modal-body">
      	<form class="form-horizontal">
			<div class="form-group">
				<label for="title" class="col-sm-2 control-label">标题</label>
				<div class="col-sm-10">
					<input id="title" name="title" class="form-control" placeholder="请输入标题">
				</div>
			</div>
			<div class="form-group">
				<label for="price" class="col-sm-2 control-label">价格</label>
				<div class="col-sm-10">
					<input id="price" name="price" class="form-control" placeholder="请输入价格">
				</div>
			</div>
			<div class="form-group">
				<label for="oldprice" class="col-sm-2 control-label">原价</label>
				<div class="col-sm-10">
					<input id="oldprice" name="oldprice" class="form-control" placeholder="请输入原价">
				</div>
			</div>
			<div class="form-group">
				<label for="salecount" class="col-sm-2 control-label">销量</label>
				<div class="col-sm-10">
					<input id="salecount" name="salecount" class="form-control" placeholder="请输入销量">
				</div>
			</div>
			<div class="form-group">
				<label for="count" class="col-sm-2 control-label">库存</label>
				<div class="col-sm-10">
					<input id="count" name="count" class="form-control" placeholder="请输入库存">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">类型</label>
				<div class="col-sm-10">
					<label class="radio-inline"><input type="radio" name="type" value="1"> 男裤</label>
					<label class="radio-inline"><input type="radio" name="type" value="2"> 女裤</label>
					<label class="radio-inline"><input type="radio" name="type" value="3"> 男鞋</label>
					<label class="radio-inline"><input type="radio" name="type" value="4"> 女鞋</label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">颜色</label>
				<div class="col-sm-10">
					<label class="checkbox-inline"><input type="checkbox" name="goodscolors" value="黑"> 黑</label>
					<label class="checkbox-inline"><input type="checkbox" name="goodscolors" value="白"> 白</label>
					<label class="checkbox-inline"><input type="checkbox" name="goodscolors" value="红"> 红</label>
					<label class="checkbox-inline"><input type="checkbox" name="goodscolors" value="绿"> 绿</label>
					<label class="checkbox-inline"><input type="checkbox" name="goodscolors" value="蓝"> 蓝</label>
					<label class="checkbox-inline"><input type="checkbox" name="goodscolors" value="紫"> 紫</label>
					<label class="checkbox-inline"><input type="checkbox" name="goodscolors" value="棕"> 棕</label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">尺码</label>
				<div class="col-sm-10">
					<label class="checkbox-inline"><input type="checkbox" name="goodssizes" value="M"> M</label>
					<label class="checkbox-inline"><input type="checkbox" name="goodssizes" value="L"> L</label>
					<label class="checkbox-inline"><input type="checkbox" name="goodssizes" value="XL"> XL</label>
					<label class="checkbox-inline"><input type="checkbox" name="goodssizes" value="2XL"> 2XL</label>
					<label class="checkbox-inline"><input type="checkbox" name="goodssizes" value="3XL"> 3XL</label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">包邮</label>
				<div class="col-sm-10">
					<label class="radio-inline"><input type="radio" name="ispost" value="1"> 是</label>
					<label class="radio-inline"><input type="radio" name="ispost" value="0"> 否</label>
				</div>
			</div>
			<div class="form-group">
				<label for="goodsgoodsimgurl" class="col-sm-2 control-label">图片地址</label>
				<div class="col-sm-10">
					<input id="goodsimgurl" name="goodsimgurl" type="file" class="form-control">
				</div>
			</div>
			<div class="form-group">
				<label for="goodsimgs" class="col-sm-2 control-label">预览图片</label>
				<div class="col-sm-10">
					<input id="goodsimgs" name="goodsimgs" type="file" multiple class="form-control">
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
		var validate = $('#addModal form').validate({
			rules: {
				title: 'required',
				price: { required: true, number: true },
				oldprice: { required: true, number: true },
				salecount: { required: true, number: true },
				count: { required: true, number: true },
				type: 'required',
				goodscolors: 'required',
				goodssizes: 'required',
				ispost: 'required',
				goodsimgurl: 'required',
				goodsimgs: 'required'
			}
		});
		
		$('#addModal').on('hidden.bs.modal', function () {
			validate.resetForm();
			$('#addModal form')[0].reset();
		})
		
		$('#addModalBtn').click(function(){
			$('#addModal').modal({ backdrop: 'static' });
		});
		
		$('#addModal #goodsimgurl').change(function() {
			validate.element('#goodsimgurl');
		});
		
		$('#addModal #goodsimgs').change(function() {
			validate.element('#addModal #goodsimgs');
		});
		
		$('#addModal').find('.btn-primary').click(function() {
			var isPass = validate.form();
			if (isPass) {
				var form = $('#addModal form')[0];
				var data = new FormData(form);
				
				$(this).attr('disabled', true);
				var self = this;
				
				$.ajax({
					url: '/admin/goodsadd.admin',
					type: 'post',
					data: data,
					processData:false,
					contentType:false
				}).done(function (res) {
					if (res.code === 0) {
						location.reload();
					}
				}).complete(function (res) {
					$('#addModal').modal('hide');
					complete(res, $(self));
				});
			}
		});
	});
</script>