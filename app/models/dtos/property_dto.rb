class PropertyDTO
  include ActiveModel::Validations

  attr_accessor :description,
    :property_type,
    :number_of_rooms,
    :number_of_baths,
    :area_size,
    :per_unit_price,
    :down_payment,
    :mortgage_term,
    :interest_rate,
    :short_description,
    :property_status,
    :street1,
    :street2,
    :city,
    :state,
    :country,
    :zip_code,
    :plot_number,
    :floor_number,
    :image1,
    :image2,
    :image3

  validates_presence_of :description,
    :property_type,
    :number_of_rooms,
    :number_of_baths,
    :property_status,
    :per_unit_price,
    :short_description,
    :street1,
    :city,
    :state,
    :country,
    :zip_code,
    :image1

  #mount_uploader :image1,:image2,:image3 ImageUploader
  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
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