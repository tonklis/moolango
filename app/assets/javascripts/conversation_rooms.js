var is_reconnect = false;
var is_end_call = false;
var is_audio_only = true;
var total_time = 600;
var time_elapsed = 0;

function slidePusher(pusherKey, session, topic_name, topic_hints_size){
	
    var pusher = new Pusher(pusherKey);
    var channel_chat = pusher.subscribe(session.substr(6,6));
	
	var hints_size = topic_hints_size;

	channel_chat.bind(session.substr(0,6), function(data) {
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

    var channel_slide = pusher.subscribe(session.substr(18,6));
	
		channel_slide.bind(session.substr(12,6), function(data) {
			$("#current_slide")[0].value = data.current_image;
			$('#slideImageDiv').css("background-image", "url(/assets/topics/" + topic_name + "/" + (parseInt(data.current_image) + 1) +".jpg)");
			$("#hint_text")[0].innerHTML = data.current_text;	
		});

}

function nextInteraction(event){
	$("#next")[0].value = event;
}

function connect() {
	session.addEventListener('sessionConnected', sessionConnectedHandler);
	session.addEventListener('streamCreated', streamCreatedHandler); 
	session.addEventListener('sessionDisconnected', sessionDisconnectedHandler); 
	session.addEventListener('connectionDestroyed', connectionDestroyedHandler);
	session.addEventListener('signalReceived', signalHandler)
	session.connect(api_key, "devtoken");
}

function reconnect() {
	is_reconnect = true;
	session.signal();
	//setTimeout(function(){connect();}, 1000);
}

function endCall() {
	is_end_call = true;
	session.signal();
}

function sessionConnectedHandler(event) {
	session.publish(publisher);
	
	if ($('#videoBtn').length == 0) {
		var parentDiv = document.getElementById("publisherDiv");
		var botonDiv = document.createElement('div');
		botonDiv.innerHTML = '<input type="button" id="videoBtn" value="Turn on video" onClick="enableDisableVideo()" style="display:none;"/>';
		botonDiv.style.position = 'absolute';
		botonDiv.style.left = '80px';
		botonDiv.style.top =  '175px';
		parentDiv.appendChild(botonDiv);
	}
	
	subscribeToStreams(event.streams);
}

function subscribeToStreams(streams) {
	for (i = 0; i < streams.length; i++) {
		stream = streams[i];
		if (stream.connection.connectionId != session.connection.connectionId) {
				session.subscribe(stream, 'waitingDiv', {width: 380, height: 285});
		}
		else {
			document.getElementById("videoBtn").style.display = 'block';
			startTimer();
		}
	}
}

function streamCreatedHandler(event) {
	subscribeToStreams(event.streams);
}

function sessionDisconnectedHandler(event) {
	if (is_reconnect) {
		is_reconnect = false;
		publisher = TB.initPublisher(api_key, 'myPublisherDiv', publisherProperties);
		connect();
	}
	else if (is_end_call) {
		is_end_call = false;
		alert("The call ended");
	}
}

function connectionDestroyedHandler(event) {
}

function signalHandler(event) {
	//is_reconnect = true;
	if (is_reconnect) {
		if ($("#waitingDiv").length == 0) {
			var waitDiv = document.createElement('div');
			waitDiv.setAttribute('id','waitingDiv');
			var waitImg = document.createElement('img');
			waitImg.setAttribute('src', '/assets/spinner.gif');
			waitImg.setAttribute('alt', 'Spinner');
			waitDiv.appendChild(document.createElement('br'));
			waitDiv.appendChild(document.createTextNode("Waiting for user to connect, please wait."));
			waitDiv.appendChild(waitImg);
			$("#waitingDivGone").append(waitDiv);
		}
		
		if (session.connection.connectionId == event.fromConnection.connectionId) {
			var div = document.createElement('div');
			div.setAttribute('id','myPublisherDiv');
			$("#publisherDiv").append(div);
			is_audio_only = true;
			document.getElementById("videoBtn").style.display = 'none';
			session.disconnect();
		}
	}
	else if (is_end_call) {
		document.getElementById("videoBtn").style.display = 'none';
		is_audio_only = true;
		session.disconnect();
	}
}
	
function enableDisableVideo() {
	is_audio_only = !is_audio_only
	publisher.publishVideo(!is_audio_only);
	if (is_audio_only)
		document.getElementById("videoBtn").value = "Turn on video";
	else
		document.getElementById("videoBtn").value = "Turn off video";
}

function startTimer() {
	if (time_elapsed < total_time) {
		time_elapsed++;
		var minutes, seconds;
		seconds = time_elapsed % 60;
		minutes = Math.floor(time_elapsed / 60) % 60;
		$('#totalTimeTxt').html(formatTime(minutes) + ' minutes ' + formatTime(seconds) + ' seconds');
		$('#timeBar').width(time_elapsed * ($('#totalTimeBar').width() / total_time));
		setTimeout(function(){ startTimer(); },1000);
	}
}

function formatTime(n) {
	if(n.toString().length < 2) {
		return '0' + n;
	} else {
		return n;
	}
}
