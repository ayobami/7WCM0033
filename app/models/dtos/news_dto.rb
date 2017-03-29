class NewsDTO
  
  include ActiveModel::Validations

  attr_accessor :title, :text, :user_id, :id, :news_date
  validates_presence_of  :title, :text
  
  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end
  
  def persisted?
    false
  end
  
end