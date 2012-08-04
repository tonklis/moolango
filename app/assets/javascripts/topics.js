	function topicOpen(topicId, currentUserId, pusherKey){

		$("#modal_message")[0].innerHTML="Connecting...";
		$("#modal_prog_bar")[0].className="progress progress-stripped";
		$("#modal_progress")[0].style.width="2%";
		$("#modal_button_accept").hide();
		$("#modal_button_accept")[0].href="#";
		$("#modal_button_close").show();

		var pusher = new Pusher(pusherKey);
		var internal_session = Math.random().toString(36).substring(7);
		var channel_confirm = pusher.subscribe(internal_session);

		channel_confirm.bind('confirm_channel', function(data) {
			if(data.message == "OK"){
				$("#modal_message")[0].innerHTML="Match found!";
				$("#modal_prog_bar")[0].className="progress progress-success";
				$("#modal_button_accept").show();
				$("#modal_button_close").hide();
				$("#modal_button_accept")[0].href="conversation_room/" + data.topic_id +"?internal_session=" + internal_session + "&open_tok_session=" + data.open_tok_session + "&user_id=" + data.user_id + "&token=" + data.token;
			}
		});

		$.ajax({ 
  		type: "POST",  
  		url: "messages/async_outbound",
  		data: 'internal_session=' + internal_session + '&topic_id=' + topicId +'&user_id=' + currentUserId,
			beforeSend: function(xhr) {
    		xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
  		},			
  		success: function() {
				$("#modal_progress")[0].style.width="100%";
				$("#modal_message")[0].innerHTML="Searching for someone to practice with...";
				$("#modal_prog_bar")[0].className="progress progress-striped active";
			},
			error: function() {
				$("#modal_message")[0].innerHTML="The site is busy, please try again later.";
				$("#modal_prog_bar")[0].className="progress progress-danger";
			} 
		});
	}

	function windowClose(){

	}
