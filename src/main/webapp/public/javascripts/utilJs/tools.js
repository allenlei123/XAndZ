function callAjax(ajaxURL, callback, data, method) {
	jQuery.ajax({
		type : method == null ? "POST" : method,
		url : ajaxURL,
		data : data,
		dataType : "json",
		success : callback,
        error:function(error,data){if(error.status==404){alert("Please check the network!");return;}}
	});
}

