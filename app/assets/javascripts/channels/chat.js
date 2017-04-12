App.chat = App.cable.subscriptions.create { channel: "ChatChannel",
 room: "CSA" },
   received: (data) ->
    $('#messages').append(data.message)

  speak: (msg) ->
    @perform 'speak', message: msg

$(document).on 'keypress', '#message_dto_message', (event) ->
  if event.keyCode is 13
    App.chat.speak(event.target.value)
    event.target.value = ""
	event.preventDefault()