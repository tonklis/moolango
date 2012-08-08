	function topicOpen(topicId, currentUserId, pusherKey, languageId){

		$("#modal_message")[0].innerHTML="Connecting...";
		$("#modal_prog_bar")[0].className="progress progress-stripped";
		$("#modal_progress")[0].style.width="2%";
		$("#modal_button_accept").hide();
		$("#modal_button_accept")[0].href="#";
		$("#modal_button_close").show();

		var pusher = new Pusher(pusherKey, { encrypted: true });
		var internal_session = Math.random().toString(36).substring(7);
		var channel_confirm = pusher.subscribe(internal_session);

		channel_confirm.bind('confirm_event', function(data) {
			if(data.message == "OK"){
				displayMatch(data);
			} else if(data.message == "OKO") {
				setTimeout(function(){displayMatch(data);}, 1500);
			}
		});

			channel_confirm.bind('room_info', function(data) {
				// HACER LO QUE QUERA CON DATA
				// data.room_id
			});

		$.ajax({ 
  		type: "POST",  
  		url: "messages/async_outbound",
  		data: 'internal_session=' + internal_session + '&topic_id=' + topicId +'&user_id=' + currentUserId + '&language_id=' + languageId,
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

	function displayMatch(data){
		$("#modal_message")[0].innerHTML="Match found!";
		$("#modal_prog_bar")[0].className="progress progress-success";
		$("#modal_button_accept").show();
		$("#modal_button_close").hide();
		if (currentUserId == data.creator_id){
			$("#modal_button_accept")[0].href="conversation_room/" + data.room_id +"?internal_session=" + data.internal_session + "&open_tok_session=" + data.open_tok_session + "&token=" + data.token;
		} else {
			$("#modal_button_accept")[0].href="join_conversation_room/" + data.room_id +"?internal_session=" + data.internal_session + "&open_tok_session=" + data.open_tok_session + "&token=" + data.token;
		}
	}

	function windowClose(userId){
		// ADD the "are you sure you want to stop your search?" dialog
		$.ajax({ 
  		type: "POST",  
  		url: "rooms/cancel",
  		data: 'user_id=' + userId,
			beforeSend: function(xhr) {
    		xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
  		} 
		});
	}
