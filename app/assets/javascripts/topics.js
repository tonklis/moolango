	function topicRedirect(topicId, currentUserId, languageId){

		$("#modal_message")[0].innerHTML="Connecting...";
		$("#modal_prog_bar")[0].className="progress progress-stripped";
		$("#modal_progress")[0].style.width="100%";
		$("#modal_button_close").show();
		$("#modal_wait_message")[0].innerHTML="";

		var internal_session = Math.random().toString(36).substring(7);

		$.ajax({ 
  		type: "POST",  
  		url: "messages/topic_redirect",
  		data: 'internal_session=' + internal_session + '&topic_id=' + topicId +'&user_id=' + currentUserId + '&language_id=' + languageId,
			beforeSend: function(xhr) {
    		xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
  		},
  		success: function(data) {
				$("#modal_prog_bar")[0].className="progress progress-striped active";
				redirectToRoom(data);	
			},
			error: function() {
				$("#modal_message")[0].innerHTML="The site is busy, please try again later.";
				$("#modal_prog_bar")[0].className="progress progress-danger";
			} 
		});
	}

	function redirectToRoom(data){
		var redirect_url;
		if (data.handshake == false){
			redirect_url = "conversation_room/" + data.room_id;
		} else {
			redirect_url = "join_conversation_room/" + data.room_id;
		}
		window.location = redirect_url;
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
