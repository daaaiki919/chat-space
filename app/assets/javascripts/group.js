$(function() {
  var word = ""

  function appendList(user_id, user_name) {
    var item = '<li class = "chat-group-user clearfix", user_id = ' + user_id + ', user_name = ' + user_name + ' >'
      + '<p class = "chat-group-user__name" >' + user_name
      + '<div class = "chat-group-user__btn">'
      + '<p class = "chat-group-user__btn--add" >' + "追加";
       $("#user-search-result").append(item);
  }

$(document).on("click", ".chat-group-user__btn", function() {
  var userId = $(this).parent().attr("user_id");
  var userName = $(this).parent().attr("user_name");
  var item = '<li class = "chat-group-member clearfix", user_id = ' + userId + ', user_name = ' + userName + ' >'
    + '<p class = "chat-group-member__name" >' + userName
    + '<div class = "chat-group-member__btn">'
    + '<input type="hidden" name="group[user_ids][]" value=' + userId + '>'
    + '<p class = "chat-group-member__btn--remove" >' + "削除";
    $("#chat-group-members").append(item);
    $(this).parent().remove();
   });

$(document).on("click", ".chat-group-member__btn", function() {
  var userId = $(this).parent().attr("user_id");
  var userName = $(this).parent().attr("user_name");
  appendList(userId, userName);
  $(this).parent().remove();
});

$(document).on('turbolinks:load', function() {
  $("#user-search-field").on("keyup", function() {
    var input          = $("#user-search-field").val();
    var splitedInputs  = input.split(" ").filter(function(e){ return e; });
    var toSearchInputs = splitedInputs.join("|");
    var reg            = new RegExp(toSearchInputs);

    if (input.length != 0 && word != toSearchInputs) {
      $(".chat-group-user").remove();
      $.each(users, function(i, user) {
        if (user.name.match(reg)) {
          appendList(user.id, user.name)
        }
      })
    }
    if (input == "") {
       $(".chat-group-user").remove();
     }
     word = toSearchInputs
   });
 });
});
