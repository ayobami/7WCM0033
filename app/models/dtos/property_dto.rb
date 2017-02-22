class PropertyDTO

  include ActiveModel::Validations

  attr_accessor :description,
    :property_type,
    :number_of_rooms,
    :number_of_baths,
    :area_size,
    :per_unit_price,
    :short_description
    
  validates_presence_of :description,
    :property_type,
    :number_of_rooms,
    :number_of_baths,
    :area_size,
    :per_unit_price,
    :short_description
    
 
  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end
    
  def persisted?
    false
  end
end