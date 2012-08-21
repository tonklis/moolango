function notify(userId, userEmail){
	$.ajax({ 
  		type: "POST",  
  		url: "earner_forms.json",
			data: { earner_form: { email: userEmail, user_id: userId, agree: true } },
			beforeSend: function(xhr) {
    		xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
  		},
  		success: function() {
				$("#notification").hide()
			},
			error: function() {
			} 
		});
}
