
class ChatHelper


 def send_cable message
   html = render_message(message)
   ActionCable.server.broadcast 'messages',
    name: message.name,
    html: html
  end
 
  def render_message message
  ApplicationController.render({
    partial: 'messages/message',
    locals: { message: message }
  })
  end
  
end