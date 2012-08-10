	function topicOpen(topicId, currentUserId, pusher, languageId){

		$("#modal_message")[0].innerHTML="Connecting...";
		$("#modal_prog_bar")[0].className="progress progress-stripped";
		$("#modal_progress")[0].style.width="2%";
		$("#modal_button_close").show();
		$("#modal_wait_message")[0].innerHTML="";
		$("#modal_alert").alert()[0].setAttribute("style","display: none");

		var internal_session = Math.random().toString(36).substring(7);
		var channel_confirm = pusher.subscribe(internal_session);

		channel_confirm.bind('confirm_event', function(data) {
			$("#modal_wait_message")[0].innerHTML="Match found!";
			$("#modal_prog_bar")[0].className="progress progress-success";
			redirectToRoom(data);
		});

		$.ajax({ 
  		type: "POST",  
  		url: "messages/async_outbound",
  		data: 'internal_session=' + internal_session + '&topic_id=' + topicId +'&user_id=' + currentUserId + '&language_id=' + languageId,
			beforeSend: function(xhr) {
    		xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
  		},
  		success: function(data) {
				$("#modal_progress")[0].style.width="100%";
				$("#modal_message")[0].innerHTML="Searching for someone to practice with...";
				$("#modal_prog_bar")[0].className="progress progress-striped active";
				$("#modal_wait_message")[0].innerHTML="Estimated wait time: 2 minutes.";
				if (data.handshake == true){
					$.ajax({ 
  					type: "POST",  
  					url: "messages/confirm_chat",
				  	data: 'room_id=' + data.room_id + '&internal_session=' + internal_session + '&open_tok_session=' + data.open_tok_session +'&token=' + data.token,
						beforeSend: function(xhr) {
				   		xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
				  	},
						success: function(){
						},
						error: function(){
						}
					});
				}
			},
			error: function() {
				$("#modal_message")[0].innerHTML="The site is busy, please try again later.";
				$("#modal_prog_bar")[0].className="progress progress-danger";
			} 
		});
	}

	function redirectToRoom(data){
		var redirect_url;
		if (currentUserId == data.creator_id){
			redirect_url = "conversation_room/" + data.room_id +"?internal_session=" + data.room_session + "&open_tok_session=" + data.open_tok_session + "&token=" + data.token;
		} else {
			redirect_url = "join_conversation_room/" + data.room_id +"?internal_session=" + data.room_session + "&open_tok_session=" + data.open_tok_session + "&token=" + data.token;
		}
		window.location = redirect_url;
	}

	function windowClose(){
		$("#modal_button_close").hide();
		$("#modal_alert").alert()[0].setAttribute("style","");
	}

	function cancelRooms(userId){
		$.ajax({ 
  		type: "POST", 
  		url: "rooms/cancel",
  		data: 'user_id=' + userId,
			beforeSend: function(xhr) {
    		xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
  		} 
		});
	}

	function hideAlert(){
		$("#modal_alert").alert()[0].setAttribute("style","display: none");
		$("#modal_button_close").show();
	}
