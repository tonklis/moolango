	function topicOpen(topicId, currentUserId, pusherKey){

		$("#modal_message")[0].innerHTML="Connecting...";
		$("#modal_prog_bar")[0].className="progress progress-stripped";
		$("#modal_progress")[0].style.width="2%";
		$("#modal_button_accept").hide();
		$("#modal_button_accept")[0].href="#";
		$("#modal_button_close").show();

		var pusher = new Pusher(pusherKey);
		var sessionId = Math.random().toString(36).substring(7);
		var channel_confirm = pusher.subscribe(sessionId);

		channel_confirm.bind('confirm_channel', function(data) {
			alert("received");
			if(data.message == "OK"){
				alert("ok");
				$("#modal_message")[0].innerHTML="Match found!";
				$("#modal_prog_bar")[0].className="progress progress-success";
				$("#modal_button_accept").show();
				$("#modal_button_close").hide();
				$("#modal_button_accept")[0].href="conversation_room/"+ data.topic_id +"?session="+data.session+"&user_id="+data.user_id;
			}
		});

		$.ajax({ 
  		type: "POST",  
  		url: "messages/async_outbound",
  		data: 'session_id=' + sessionId + '&topic_id=' + topicId +'&user_id=' + currentUserId,
			beforeSend: function(xhr) {
    		xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
  		},			
  		success: function() {
				$("#modal_progress")[0].style.width="100%";
				$("#modal_message")[0].innerHTML="Searching for someone to practice with...";
				$("#modal_prog_bar")[0].className="progress progress-striped active";
				alert(data);
			},
			error: function() {
				$("#modal_message")[0].innerHTML="The site is busy, please try again later.";
				$("#modal_prog_bar")[0].className="progress progress-danger";
			} 
		});
	}

	function windowClose(){

	}
