var selected_star = 0;
var is_reconnect = false;
var is_end_call = false;
var is_audio_only = true;
var is_ready_for_conversation = false;
var is_timer_running = false;
var time_elapsed = 0;
var num_streams = 0;

function submitWithMessage(){
	if ($("#chat_field")[0].value	!= ""){
		$("#new_message").submit();
	}	

}

function validateEnterKey(e){

	var key;      
  if(window.event)
  	key = window.event.keyCode; //IE
	else
  	key = e.which; //firefox      

	if (key == 13){
		submitWithMessage();
	}
	return (key != 13);
}

function simplePusher(pusherKey, session) {
	
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
	
	channel.bind('event_end_call', function(data) {
		endCall();
	});

	channel.bind('event_interaction', function(data) {
		if ($("#origin_field")[0].value == 'true') {
			if (data.button_pressed == 'btnNext') {
				$('.btnNext')[0].click();
			}else if(data.button_pressed == 'btnPrevious') {
				$('.btnPrevious')[0].click();
			}else if(data.button_pressed == 'btnLast') {
				$('.btnLast')[0].click();
			}else{
				$('.btnFirst')[0].click();
			}
		}	
	});
}


function nextInteraction(button_pressed){
	$.ajax({ 
		type: "POST",  
		url: "/interaction",
		data: "button_pressed=" + button_pressed + "&channel=" + $("#internal_session")[0].value,
		beforeSend: function(xhr) {
			xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
		},			
		success: function(data) {
		},
		error: function(jqXHR, textStatus, errorThrown) {
		} 
	});
}

function connect() {
	session.addEventListener('connectionCreated', connectionCreatedHandler);
	session.addEventListener('sessionConnected', sessionConnectedHandler);
	session.addEventListener('streamCreated', streamCreatedHandler); 
	session.addEventListener('sessionDisconnected', sessionDisconnectedHandler); 
	session.addEventListener('connectionDestroyed', connectionDestroyedHandler);
	session.addEventListener('streamDestroyed', streamDestroyedHandler);
	session.addEventListener('signalReceived', signalHandler);
	//TB.addEventListener('exception', function(event){alert(event.message);});
	session.connect(api_key, token, {detectConnectionQuality:0});
}

function connectionCreatedHandler(event) {
	getConnectionData(event.connections);
}

function sessionConnectedHandler(event) {
	if ($('#videoBtn').length == 0) {
		var botonDiv = document.createElement('div');
		botonDiv.innerHTML = '<input type="button" id="videoBtn" class="videoButton" onClick="enableDisableVideo()" style="display:none;" title = "Video On"/>';
		botonDiv.style.position = 'absolute';
		botonDiv.style.right = '0px';
		botonDiv.style.top =  '0px';
		botonDiv.style.border = 'none';
		$('#publisherDiv').append(botonDiv);
	}

	getConnectionData(event.connections);
	subscribeToStreams(event.streams);
	session.publish(publisher);
}

function streamCreatedHandler(event) {
	subscribeToStreams(event.streams);
}

function sessionDisconnectedHandler(event) {
	if (is_reconnect) {
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
}

function streamDestroyedHandler(event) {
	num_streams -=1;
}

function signalHandler(event) {
	is_reconnect = true;
	if (session.connection.connectionId == event.fromConnection.connectionId) {
		is_audio_only = true;
		$('#videoBtn').css({display: 'none'});
		$('#videoBtn').css({'background-image': "url('/assets/webpage/videobutton.png')"});
		$('#videoBtn')[0].title = "Video On"
		var div = document.createElement('div');
		div.setAttribute('id','myPublisherDiv');
		$("#publisherDiv").append(div);
		session.disconnect();
	}
}

function getConnectionData(connections) {
	for (i = 0; i < connections.length; i++) {
		connection = connections[i];
	}
}

function subscribeToStreams(streams) {
	for (i = 0; i < streams.length; i++) {
		stream = streams[i];
		num_streams++;
		if (stream.connection.connectionId != session.connection.connectionId) {
				session.subscribe(stream, 'waitingDiv', {width: 380, height: 285});
		}
		else {
			$("#publisherDiv").css('margin', 'auto auto auto auto');
			$("#publisherDiv")[0].style.position = 'absolute';
			$("#publisherDiv")[0].style.right = '0px';
			$("#publisherDiv")[0].style.bottom = '0px';
			$('#videoBtn').css({display: 'block'});
		}
		if (is_ready_for_conversation && num_streams == 2) {
			is_timer_running = true;
			startTimer();
		}
		else {
			is_ready_for_conversation = true
		}
	}
}

function reconnect() {
	session.signal();
}

function endCall() {
	is_end_call = true;
	$('#videoBtn').css({display: 'none'})
	is_timer_running = false;
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
	}
}

function enableDisableVideo() {
	is_audio_only = !is_audio_only
	publisher.publishVideo(!is_audio_only);
	if (is_audio_only) {
		$('#videoBtn').css({'background-image': "url('/assets/webpage/videobutton.png')"});
		$('#videoBtn')[0].title = "Video On"
	}
	else {
		$('#videoBtn').css({'background-image': "url('/assets/webpage/videobuttonoff.png')"});
		$('#videoBtn')[0].title = "Video Off"
	}
}

function startTimer() {
	if (time_elapsed < total_time && is_timer_running) {
		time_elapsed++;
		if (time_elapsed == 60 && is_buyer) {
			$.ajax({ 
				type: "POST",  
				url: "/users/new_balance",
				data: "total_time=" + total_time,
				beforeSend: function(xhr) {
					xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
				},			
				success: function(data) {
					credits = data.credits;
				},
				error: function(jqXHR, textStatus, errorThrown) {
					//alert(textStatus);
				} 
			});
		}
		if (time_elapsed == (total_time*.85) ) {
			$('#totalTimeBar').css({'background-image': "url('/assets/timer_full_red.png')"});
		}

		/*if ( (0 == time_elapsed % 90) && is_buyer) {
			nextInteraction(true);
		}*/
		var minutes, seconds;
		seconds = time_elapsed % 60;
		minutes = Math.floor(time_elapsed / 60) % 60;
		//$('#totalTimeTxt').html(formatTime(minutes) + ' minutes ' + formatTime(seconds) + ' seconds');
		$('#timeBar').height($('#totalTimeBar').height() - time_elapsed * ($('#totalTimeBar').height() / total_time));
		setTimeout(function(){ startTimer(); }, 1000);
	}
	else {
		// NOTIFY THE TIME IS OVER
	}
}

function formatTime(n) {
	if (n.toString().length < 2) {
		return '0' + n;
	} else {
		return n;
	}
}

function showModal() {
	is_end_call = false;
	$('#myModal').modal({
		keyboard: false,
		backdrop: false
	});
	$('#myModal').modal('show');
	//$('#waitingDivGone').remove();
}

function selectStars(element, stars) {
	var max = stars - 1;
	$('#' + element +' > .description').text('');
	$('#' + element +' > .star').each(function(index) {
		if (index <= max) {
			$(this).css({'background-position':'0 -25px'});
			$('#' + element +' > .description').text($(this).attr("description"));
		}
		else if (index >= stars) {
			$(this).css({'background-position':'0 0'});
		}
	});
}

function windowClose() {

}
