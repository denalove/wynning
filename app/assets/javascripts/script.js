var template = function(text) {
  return '<p><input type="checkbox"><i class="glyphicon glyphicon-star"></i><span>' + text + '</span><i class="glyphicon glyphicon-remove"></i></p>';
};

var main = function() {

  // Adds new item on submit
  // $('form').on('submit', function() {
  //   var text = $("#todo").val(),
  //       html = template(text);
  //
  //   $('.list').append(html);
  //   $("#todo").val("");
  //
  //   return false;
  // });

  // Instead of...
  // $('.glyphicon-star').on('click', function() {
  //   $(this).toggleClass('active');
  // })

  // Toggle star color
  $('.list').on('click', '.glyphicon-star', function() {
    $(this).toggleClass('active');
  })


  $('.list').on('click', '.glyphicon-remove', function() {
    $(this).parent().remove();
  });

};

$(document).ready(main);
