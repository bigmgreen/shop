function complete(res, btn) {
	if (res.status !== 200) {
		$('#errorModal').modal();
	} else if (res.responseText.indexOf('欢迎登录') !== -1) {
		$('#loginModal').modal();
	}
	
	btn.attr('disabled', false);
}