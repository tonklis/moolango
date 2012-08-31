var selected_star = 0;
var is_reconnect = false;
var is_end_call = false;
var is_audio_only = false;
var is_ready_for_conversation = false;
var is_timer_running = false;
var is_recording = false;
var num_connections = 0;
var total_time = 600; //30;
var time_elapsed = 0;
var archive;
var archive_id;

function createPusher(pusherKey, session){
	
	var pusher = new Pusher(pusherKey, { encrypted: true });
	var channel = pusher.subscribe(session);

	channel.bind('event_chat', function(data) {
		var new_li = document.createElement('li');
		if (data.origin == 'true') {
			new_li.setAttribute('style','background-color:#DDDDDD');
		}
		new_li.innerHTML = data.message;
		$("#chat").append(new_li);
		document.getElementById("chat").scrollTop = document.getElementById("chat").scrollHeight;
		if ($("#origin_field")[0].value == data.origin){
				$("#new_message")[0].reset();
		}
	});

	channel.bind('event_slider', function(data) {
		$("#current_slide")[0].value = data.id;
		$('#slideImageDiv').css("background-image", "url(/assets/" + data.thumbnail_url+")");
		$("#hint_text")[0].innerHTML = data.description;	
	});
	
	channel.bind('event_end_call', function(data) {
		endCall();
	});
}

function nextInteraction(event){
	$("#next")[0].value = event;
	$("#new_interaction").submit();
}

function connect() {
	session.addEventListener('connectionCreated', connectionCreatedHandler);
	session.addEventListener('sessionConnected', sessionConnectedHandler);
	session.addEventListener('streamCreated', streamCreatedHandler); 
	session.addEventListener('sessionDisconnected', sessionDisconnectedHandler); 
	session.addEventListener('connectionDestroyed', connectionDestroyedHandler);
	session.addEventListener('signalReceived', signalHandler);
	session.addEventListener('archiveCreated', archiveCreatedHandler);
	session.addEventListener('sessionRecordingStarted', startRecordingHandler);
	session.addEventListener('sessionRecordingStopped', stopRecordingHandler);
	session.addEventListener('archiveClosed', archiveClosedHandler);
	//TB.addEventListener('exception', function(event){alert(event.message);});
	session.connect(api_key, token, {detectConnectionQuality:0});
}

function reconnect() {
	session.signal();
}

function endCall() {
	is_end_call = true;
	$('#videoBtn').css({display: 'none'})
	is_timer_running = false;
	if (is_recording) {
		session.stopRecording(archive);
	}
	else {
		session.disconnect();
	}
}

function connectionCreatedHandler(event) {
	num_connections += event.connections.length;
	getConnectionData(event.connections);
}

function sessionConnectedHandler(event) {
	num_connections += event.connections.length;
	
	if ($('#videoBtn').length == 0) {
		var botonDiv = document.createElement('div');
		botonDiv.innerHTML = '<input type="button" id="videoBtn" class="conversationButton" value="Turn off video" onClick="enableDisableVideo()" style="display:none;"/>';
		botonDiv.style.position = 'absolute';
		botonDiv.style.left = '80px';
		botonDiv.style.top =  '175px';
		$('#publisherDiv').append(botonDiv);
	}

	if (event.archives.length == 0) {
		session.createArchive(api_key, "perSession", session.sessionId);
	}

	getConnectionData(event.connections);
	subscribeToStreams(event.streams);
	session.publish(publisher);
}

function getConnectionData(connections) {
	for (i = 0; i < connections.length; i++) {
		connection = connections[i];
		if (connection.connectionId != session.connection.connectionId)
			$('#userDiv').text(connection.data);
	}
}

function subscribeToStreams(streams) {
	for (i = 0; i < streams.length; i++) {
		stream = streams[i];
		if (stream.connection.connectionId != session.connection.connectionId) {
				session.subscribe(stream, 'waitingDiv', {width: 380, height: 285});
		}
		else {
			//$('#videoBtn').css({display: 'block'})
		}
		if (is_ready_for_conversation && num_connections == 2) {
			is_timer_running = true;
			startTimer();
			if (archive) {
				is_recording = true;
				session.startRecording(archive);
			}
		}
		else {
			is_ready_for_conversation = true
		}
	}
}

function streamCreatedHandler(event) {
	subscribeToStreams(event.streams);
}

function sessionDisconnectedHandler(event) {
	if (is_reconnect) {
		num_connections -= 1;
		showWaitSpiner();
		publisher = TB.initPublisher(api_key, 'myPublisherDiv', publisherProperties);
		connect();
	}
	else if (is_end_call) {
		showModal();
	}
}

function connectionDestroyedHandler(event) {
	if (is_reconnect) {
		showWaitSpiner();
	}
	else {
		endCall();
	}
}

function signalHandler(event) {
	is_reconnect = true;
	if (session.connection.connectionId == event.fromConnection.connectionId) {
		is_audio_only = false;
		//document.getElementById("videoBtn").style.display = 'none';
		$('#videoBtn').css({display: 'none'})
		$('#videoBtn').val('Turn off video');
		var div = document.createElement('div');
		div.setAttribute('id','myPublisherDiv');
		$("#publisherDiv").append(div);
		session.disconnect();
	}
}

function archiveCreatedHandler(event) {
	archive = event.archives[0];
	archive_id = archive.archiveId;
	
	if (is_ready_for_conversation && num_connections == 2) {
		is_recording = true;
		session.startRecording(archive);
	}
	
	if (room_id != undefined){
		$.ajax({ 
			type: "POST",  
			url: "/rooms/add_record_data/" + room_id,
 			data: 'record_id=' + archive_id,
			beforeSend: function(xhr) {
				xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
			}
		});
	}
}

function keepalive(){
	$.ajax({ 
		type: "POST",  
		url: "/rooms/keepalive/" + room_id,
		beforeSend: function(xhr) {
			xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
		}
	});
}

function startRecordingHandler(event) {
	$('#videoBtn').css({display: 'block'});
}

function stopRecordingHandler(event) {
	if (is_recording) {
		is_recording = false;
		session.closeArchive(archive);
	}
}

function archiveClosedHandler(event) {
	session.disconnect();
}

function showWaitSpiner() {
	is_reconnect = false;
	if ($("#waitingDiv").length == 0) {
		var waitDiv = document.createElement('div');
		waitDiv.setAttribute('id','waitingDiv');
		var waitImg = document.createElement('img');
		waitImg.setAttribute('src', '/assets/spinner.gif');
		waitImg.setAttribute('alt', 'Spinner');
		waitDiv.appendChild(document.createElement('br'));
		waitDiv.appendChild(document.createTextNode("Waiting for user to connect, please wait."));
		waitDiv.appendChild(waitImg);
		$("#userDiv").before(waitDiv);
	}
}

function enableDisableVideo() {
	is_audio_only = !is_audio_only
	publisher.publishVideo(!is_audio_only);
	if (is_audio_only)
		$('#videoBtn').val('Turn on video');
		//document.getElementById("videoBtn").value = "Turn on video";
	else
		$('#videoBtn').val('Turn off video');
		//document.getElementById("videoBtn").value = "Turn off video";
}

function startTimer() {
	if (time_elapsed < total_time && is_timer_running) {
		time_elapsed++;
		//if (time_elapsed >= total_time - 60) {
		if (time_elapsed == 60 && is_buyer) {
			$.ajax({ 
				type: "POST",  
				url: "/users/new_balance",
				beforeSend: function(xhr) {
					xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
				},			
				success: function(data) {
					credits = data.credits;
				},
				error: function(jqXHR, textStatus, errorThrown) {
					alert(textStatus);
				} 
			});
		}
		if (time_elapsed == 60) {
			$('#timeBar').css('background-image', "url('/assets/timer_full_yellow.png')");
		}

		if ( (0 == time_elapsed % 60) && is_buyer) {
			nextInteraction(true);
		}
		var minutes, seconds;
		seconds = time_elapsed % 60;
		minutes = Math.floor(time_elapsed / 60) % 60;
		$('#totalTimeTxt').html(formatTime(minutes) + ' minutes ' + formatTime(seconds) + ' seconds');
		$('#timeBar').width(time_elapsed * ($('#totalTimeBar').width() / total_time));
		setTimeout(function(){ startTimer(); },1000);
	}
	else {
		endCall();
	}
}

function formatTime(n) {
	if (n.toString().length < 2) {
		return '0' + n;
	} else {
		return n;
	}
}

function formatCredits(value) {
	/*if (value.toString().length < 4) {
		return '$' + value + '0';
	}*/
	return '$' + value;
}

function openDisconnectDialog() {
	if (!is_end_call) {
		$.ajax({ 
			type: "POST",
			async : false,
			url: "/interaction/end_call",
			data: "room_id=" + room_id,
			beforeSend: function(xhr) {
				xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
			}
		});
	}
}

function showModal() {
	is_end_call = false;
	$('#modal_message').html('<p> Your new balance is: ' + formatCredits(credits));
	$('#myModal').modal({
		keyboard: false,
		backdrop: false
	});
	$('#myModal').modal('show');
	//$('#waitingDivGone').remove();
}

function selectStars(stars) {
	var max = stars - 1;
	$('.star').each(function(index) {
		if (index <= max) {
			$(this).css({'background-position':'0 -25px'});
		}
		else if (index >= stars) {
			$(this).css({'background-position':'0 0'});
		}
	});
}

function windowClose() {

}
