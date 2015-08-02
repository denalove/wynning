// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

// user_validations = function() {
// 	$('#create-user').on('click', function(e){
// 	e.preventDefault();

// 	var high_level_goal = $('#user_high_level_goal').val();
// 	var first_name = $('#user_first_name').val();
// 	var last_name = $('#user_last_name').val();
// 	var email = $('#user_email').val();
// 	var phone_number = $('#user_phone_number').val();
// 	var username = $('#user_username').val();
// 	var password_confirm = $('#user_password_confirmation').val();

// 	var user_data = {user:{
// 		high_level_goal:high_level_goal, first_name: first_name, last_name: last_name, email: email,
// 		phone_number: phone_number, username: username, password_digest: password_confirm
// 	}}
// 		$.ajax({
// 		type: 'POST',
// 		url: '/users',
// 		data: user_data,
// 			success: function() {
//         var msgBox = '<div class="col-md-12 messageBody">' + msg + '<p class="messageTime">sent: less than a minute ago.</p><br></div>';
//         self.closest('#new_reply').before(msgBox);
//         self.parent().siblings('div.field').children('#reply_body').val("");
//       },
//       error: function(request, error) {
//         console.log(arguments);
//         alertUser("failure");
// 			}
// 		});
// 	});
// }

// $(document).ready(user_validations);
// $(document).on('page:load', user_validations);
