function notify(userId, userEmail){
	$.ajax({ 
  		type: "POST",  
  		url: "earner_forms.json",
			data: { earner_form: { email: userEmail, user_id: userId, agree: true } },
			beforeSend: function(xhr) {
    		xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
  		},
  		success: function() {
				$("#notification").hide()
			},
			error: function() {
			} 
		});
}

function prepareConversation(conversation_id) {
	$("#modal_title")[0].innerHTML="Please wait";
	$("#modal_message")[0].innerHTML="Loading...";
	$("#modal_prog_bar")[0].className="progress progress-stripped";
	$("#modal_progress")[0].style.width="100%";
	$("#modal_button_close").show();
	$("#modal_wait_message")[0].innerHTML="";
	$("#modal_button_close").hide();

	if (checkRequirements()) {
		var redirect_url = "conversation_room/" + conversation_id;
		window.location = redirect_url;
	}
	else {
		$("#modal_title")[0].innerHTML="Upgrade Flash Player";
		$("#modal_message")[0].innerHTML = "Your version of Flash Player doesn't meet the minimum requirements for this application. \n Please <a href='http://get.adobe.com/flashplayer/' target='_blank'>upgrade</a> to continue";
		$("#modal_prog_bar")[0].className="progress progress-danger";
		$("#modal_button_close").show();
	}
}

function checkRequirements() {
	if (!TB.checkSystemRequirements()) {
	    return false;
	}
	return true;
}
