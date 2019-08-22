App.room = App.cable.subscriptions.create "WebNotificationsChannel",

received: (data) ->
  $('#notification').append '<a class="dropdown-item" href="#">' + data['notification'] + '</a>'
  $('#notifications-count,.notifications-count').text data['count']