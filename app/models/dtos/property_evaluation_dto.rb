class PropertyEvaluationDTO
  include ActiveModel::Validations

  attr_accessor :id,
    :property_id,
    :property_number,
    :instructions,
    :site_area,
    :number_of_rooms,
    :number_of_baths,
    :zoning,
    :comments,
    :terms_of_reference,
    :date_of_inspection,
    :date_of_valuation,
    :land_value,
    :improvements,
    :market_valuation,
    :registered_proprietor,
    :land_dimensions,
    :land_area,
    :encumberances,
    :topography,
    :services,
    :environmental_issues,
    :location,
    :dwelling_description,
    :construction,
    :pc_items,
    :fixture_features,
    :other_improvements,
    :building_areas,
    :image1,
    :image2,
    :image3

  validates_presence_of :comments,
    :land_value,
    :date_of_inspection,
    :market_valuation
    
  #mount_uploader :image1,:image2,:image3 ImageUploader
  def initialize(attributes = {})
    attributes.each do |name, value|
      if (name.to_s.include? 'date_of_inspection' )
        next
      elsif (name.to_s.include? 'date_of_valuation' )
        next
      end
      send("#{name}=", value)
    end  
      flattened_date=%w(1 2 3).map { |e| attributes["date_of_inspection(#{e}i)"].to_i }
      flattened_date2=%w(1 2 3).map { |e| attributes["date_of_valuation(#{e}i)"].to_i }
      
      if(flattened_date.count(0) !=3)
        send('date_of_inspection=', Date.new(flattened_date[0],flattened_date[1],flattened_date[2]))   
      end
      if(flattened_date2.count(0) !=3)
        send('date_of_valuation=', Date.new(flattened_date[0],flattened_date[1],flattened_date[2]))   
      end
  end
  

  def save
    self.store_image1!
    self.store_image2!
    self.store_image3!
  end

  def persisted?
    false
  end

end