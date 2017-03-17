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

  var updateTime = 8000;
  setInterval(autoUpdate, updateTime);

  function autoUpdate() {
    var user_url = document.location.pathname;
    if (user_url.match(/messages/)) {
      $.ajax({
        type: 'GET',
        url: user_url,
        dataType: 'json'
      })
      .done(function(messages) {
        var user_message_number = $('.message__contents').length;
        console.log(messages.length)
        if(user_message_number != messages.length) {
          for (var i = user_message_number; i < messages.length; i++) {
            var html = buildHTML(messages[i]);
            $('ul.message').append(html);
            scroll_view();
          }
        }
      })
      .fail(function() {
        alert('error');
      });
    }
  };

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
