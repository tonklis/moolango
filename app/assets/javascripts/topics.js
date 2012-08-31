	var time_elapsed = 0;

	function topicRedirect(topicId, currentUserId, languageId){

		$("#modal_message")[0].innerHTML="Connecting...";
		$("#modal_prog_bar")[0].className="progress progress-stripped";
		$("#modal_progress")[0].style.width="100%";
		$("#modal_button_close").show();
		$("#modal_wait_message")[0].innerHTML="";
		$("#modal_button_close").hide();

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
				redirectToRoom(data,false);
			},
			error: function() {
				$("#modal_message")[0].innerHTML="The site is busy, please try again later.";
				$("#modal_prog_bar")[0].className="progress progress-danger";
				$("#modal_button_close").show();
			} 
		});
	}

	function redirectToRoom(data, join){
		var redirect_url;
		if (join) {
			redirect_url = "join_conversation_room/" + data.room_id;
		} else {
			redirect_url = "conversation_room/" + data.room_id;
		}
		window.location = redirect_url;
	}

	function verifyAndRedirect(topicId){
		roomId = $("#join_now_topic_"+topicId)[0].getAttribute("data-room-id");
		$.ajax({	
			type: "POST", 
  		url: "rooms/verify/"+roomId,
			beforeSend: function(xhr) {
    		xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
  		},
			success: function(data){
				if (data.room_id){
					redirectToRoom(data, true);
				} else {
					alert("The room is busy. Please try again later");
					$("#join_now_topic_"+topicId)[0].setAttribute("data-room-id","");
					queryRooms();
				}
			},
			error: function(jqXHR, textStatus, errorThrown){
				alert(textStatus);
				$("#join_now_topic_"+topicId)[0].setAttribute("data-room-id","");
				queryRooms();
			}
		});
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

	function queryRooms(){
		$(".button_topic").hide();
		$(".waiting_topic").show();
		$(".text_topic").show();

		$.ajax({ 
  		type: "POST", 
  		url: "rooms/available",
			beforeSend: function(xhr) {
    		xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
  		},
			success: function(data){
				for (var prop in data){
					$("#button_topic_"+prop).show();
					$("#join_now_topic_"+prop)[0].setAttribute("data-room-id",data[prop]);
					$("#waiting_topic_"+prop).hide();
					$("#text_topic_"+prop).hide();
				}
			},
			error: function(jqXHR, textStatus, errorThrown){
				alert(textStatus);
			}
		});
	}

	function queryRoomsTimer() {
		time_elapsed++;
		if (0 == time_elapsed % 5) {
			queryRooms();
		}
		setTimeout(function(){ queryRoomsTimer(); },1000);
	}
