class MessageDTO
  
  attr_accessor :email, :name, :text, :user_id, :agent_id, :message_date, :chat_id

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end
  
  def persisted?
    false
  end
  
end