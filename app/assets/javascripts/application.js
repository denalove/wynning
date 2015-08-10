// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require jquery.easing.min
//= require jquery.fittext
//= require wow.min
//= require_tree .

$(document).on("ready page:load", function(){

  var current_fs, next_fs, previous_fs; //fieldsets
  var left, opacity, scale; //fieldset properties which we will animate
  var animating; //flag to prevent quick multi-click glitches
  var modalHLG = document.getElementById('modalHLG');
    var modalCompHLG = document.getElementById('modalCompHLG');
    var modalCompOMG = document.getElementById('modalCompOMG');
    var modalCompACT = document.getElementById('modalCompACT');
    var shadeHLG = document.getElementById('shadeHLG');
    var modalLogin = document.getElementById('modalLogin');
    var shadeLogin = document.getElementById('shadeLogin');


      document.getElementById('loginLink').onclick= function()  {
      modalLogin.style.display='block';
      shadeLogin.style.display= 'block';
      };

      document.getElementById('close').onclick= function() {
      modalLogin.style.display=shadeLogin.style.display= 'none';
      };

        document.getElementById('HLGLink').onclick= function()  {
        modalHLG.style.display='block';
        shadeHLG.style.display= 'block';
        };

        document.getElementById('HLGLink2').onclick= function()  {
        modalHLG.style.display='block';
        shadeHLG.style.display= 'block';
        };


        document.getElementById('HLGclose').onclick= function() {
        modalHLG.style.display=shadeHLG.style.display= 'none';
        };

        document.getElementById('HLGdone').onclick= function()  {
        modalCompHLG.style.display='block';
        shadeHLG.style.display= 'block';
        };

        document.getElementById('HLGcomplete').onclick= function() {
        modalCompHLG.style.display=shadeHLG.style.display= 'none';
        };

        document.getElementById('OMGdone').onclick= function()  {
        modalCompOMG.style.display='block';
        shadeHLG.style.display= 'block';
        };

        document.getElementById('OMGcomplete').onclick= function() {
        modalCompOMG.style.display=shadeHLG.style.display= 'none';
        };

        document.getElementById('ACTdone').onclick= function()  {
        modalCompACT.style.display='block';
        shadeHLG.style.display= 'block';
        };

        document.getElementById('ACTcomplete').onclick= function() {
        modalCompACT.style.display=shadeHLG.style.display= 'none';
        };
  $(".next").click(function(){
    console.log("clicked");
  	if(animating) return false;
  	animating = true;

  	current_fs = $(this).parent();
  	next_fs = $(this).parent().next();

  	//activate next step on progressbar using the index of next_fs
  	$("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");

  	//show the next fieldset
  	next_fs.show();
  	//hide the current fieldset with style
  	current_fs.animate({opacity: 0}, {
  		step: function(now, mx) {
  			//as the opacity of current_fs reduces to 0 - stored in "now"
  			//1. scale current_fs down to 80%
  			scale = 1 - (1 - now) * 0.2;
  			//2. bring next_fs from the right(50%)
  			left = (now * 50)+"%";
  			//3. increase opacity of next_fs to 1 as it moves in
  			opacity = 1 - now;
  			current_fs.css({'transform': 'scale('+scale+')'});
  			next_fs.css({'left': left, 'opacity': opacity});
  		},
  		duration: 800,
  		complete: function(){
  			current_fs.hide();
  			animating = false;
  		},
  		//this comes from the custom easing plugin
  		easing: 'easeInOutBack'
  	});
  });

  $(".previous").click(function(){
  	if(animating) return false;
  	animating = true;

  	current_fs = $(this).parent();
  	previous_fs = $(this).parent().prev();

  	//de-activate current step on progressbar
  	$("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");

  	//show the previous fieldset
  	previous_fs.show();
  	//hide the current fieldset with style
  	current_fs.animate({opacity: 0}, {
  		step: function(now, mx) {
  			//as the opacity of current_fs reduces to 0 - stored in "now"
  			//1. scale previous_fs from 80% to 100%
  			scale = 0.8 + (1 - now) * 0.2;
  			//2. take current_fs to the right(50%) - from 0%
  			left = ((1-now) * 50)+"%";
  			//3. increase opacity of previous_fs to 1 as it moves in
  			opacity = 1 - now;
  			current_fs.css({'left': left});
  			previous_fs.css({'transform': 'scale('+scale+')', 'opacity': opacity});
  		},
  		duration: 800,
  		complete: function(){
  			current_fs.hide();
  			animating = false;
  		},
  		//this comes from the custom easing plugin
  		easing: 'easeInOutBack'
  	});
  });

  // $(".submit").click(function(){
  //   var valuesToSubmit = $('form').serialize();
  //   $.ajax({
  //       type: "POST",
  //       url: '/users', //sumbits it to the given url of the form
  //       data: valuesToSubmit,
  //       dataType: "JSON" // you want a difference between normal and ajax-calls, and json is standard
  //   }).success(function(json){
  //       console.log("success", json);
  //   });
  // 	return false;
  // })

});
