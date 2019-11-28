function complete(res, btn) {
	
	if ((res.code && res.code !== 0) || (res.status && res.status !== 200) || res.responseText == '{"code":-1,"msg":null,"reslut":null}') {
		$('#errorModal').modal();
	} else if (res.responseText && res.responseText.indexOf('登录') !== -1) {
		$('#loginModal').modal();
	}
	
	btn.attr('disabled', false);
}