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
			$("#new_message")[0].reset();
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

function sessionConnectedHandler(event) {
		session.publish(publisher);
		
		var parentDiv = document.getElementById("publisherDiv");
		var botonDiv = document.createElement('div');
		botonDiv.innerHTML = '<input type="button" id="videoBtn" value="Turn on video" onClick="enableDisableVideo()" style="display:none;"/>';
		botonDiv.style.position = 'absolute';
		botonDiv.style.left = '80px';
		botonDiv.style.top =  '175px';
		parentDiv.appendChild(botonDiv);
		
		subscribeToStreams(event.streams);
}

function subscribeToStreams(streams) {
		for (i = 0; i < streams.length; i++) {
			stream = streams[i];
			if (stream.connection.connectionId != session.connection.connectionId) {
					session.subscribe(stream, 'waitingDiv', {width: 380, height: 285});
			}
		}
}

function streamCreatedHandler(event) {
		subscribeToStreams(event.streams);
		document.getElementById("videoBtn").style.display = 'block';
}

function connect(){
		session.addEventListener('sessionConnected', sessionConnectedHandler);
		session.addEventListener('streamCreated', streamCreatedHandler); 
		session.connect(api_key, "devtoken");
}

function reconnect(){
		var div = document.createElement('div');
		div.setAttribute('id','myPublisherDiv');
		$("#publisherDiv").append(div);

		session.unpublish(publisher);
		session.unsubscribe(stream);
		session.disconnect();

		setTimeout(function(){connect();}, 1000);
}
	
function enableDisableVideo() {
		audioOnly = !audioOnly
		publisher.publishVideo(!audioOnly);
		if (audioOnly)
			document.getElementById("videoBtn").value = "Turn on video";
		else
			document.getElementById("videoBtn").value = "Turn off video";
}
