$(function() {
  function buildHTML(message) {
    var html = '<li class="message__contents">' +
    '<p class="message__contents__sender">' +
    message.name +
    '<p class="message__contents__time">' +
    message.time +
    '<p class="message__contents__content">' +
    message.body;
    return html;
  }

  function scroll_view(){
    $('.right-content__middle').animate({scrollTop: $('.right-content__middle')[0].scrollHeight}, 'fast');
  }

  $('#new_message').on('submit', function(e) {
    e.preventDefault();
    var textField = $('.text');
    var message_input = textField.val();
    var message_url = $("#new_message").attr("action");
    $.ajax({
      type: 'POST',
      url: message_url,
      data: {
        message: {
          body: message_input
        }
      },
      dataType: 'json',
    })
    .done(function(data) {
      var html = buildHTML(data);
      $('ul.message').append(html);
      textField.val('');
      scroll_view();
    })
    .fail(function() {
      alert('error');
    });
    return false
  });
});
