function complete(res, btn) {
	
	if ((res.code && res.code !== 0) || (res.status && res.status !== 200)) {
		$('#errorModal').modal();
	} else if (res.responseText && res.responseText.indexOf('欢迎登录') !== -1) {
		$('#loginModal').modal();
	}
	
	btn.attr('disabled', false);
}