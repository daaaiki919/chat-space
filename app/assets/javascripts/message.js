$(function() {
  function buildHTML(message) {
    var html = $('<li class="message">').append(message.content);
  }

  $('.js-form').on('submit', function(e) {
    e.preventDefault();
    var textField = $('.js-form__text-field');
    var message = textField.val();
    $.ajax({
      type: 'POST',
      url: '/message.json',
      date: {
        message: {
          content: message
        }
      },
      datetype: 'json'
    })
    .done(function(date) {
      var html = buildHTML(date);
      $('.messages').append(html);
      textField.val('');
    })
    .fail(function() {
      alert('error');
    });
  });
});
