class SearchDTO
  include ActiveModel::Validations

  attr_accessor :search_text, :min_price, :max_price,:no_of_rooms, :no_of_baths, :property_number
  
  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end
  
  def persisted?
    false
  end
  
end