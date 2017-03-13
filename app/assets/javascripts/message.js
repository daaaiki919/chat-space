$(function() {
  function buildHTML(message) {
    var messageForm = '<li class="message__contents">' +
    '<p class="message__contents__sender">' +
    message.name +
    '<p class="message__contents__time">' +
    message.time;
    if (message.image) {
    var body = '<p class="message__contents__content">' + '<img src=' + message.image + '>';
    } else {
    var body = '<p class = "message__contents__content" >' + message.body;
    }
    var html = messageForm + body;
    return html;
  }

  function scroll_view(){
    $('.right-content__middle').animate({scrollTop: $('.right-content__middle')[0].scrollHeight}, 'fast');
  }

  $('#new_message').on('submit', function(e) {
    e.preventDefault();
    var textField = $('.text');
    var fileField = $('.set_image');
    var form = new FormData($(this).get(0));
    var message_url = $("#new_message").attr("action");
    $.ajax({
      type: 'POST',
      url: message_url,
      data: form,
      processData: false,
      contentType: false,
      dataType: 'json'

    })
    .done(function(data) {
      var html = buildHTML(data);
      $('ul.message').append(html);
      textField.val('');
      fileField.val('');
      scroll_view();
    })
    .fail(function() {
      alert('error');
    });
    return false
  });
});
