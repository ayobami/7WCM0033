class MortgageDTO
  include ActiveModel::Validations

  attr_accessor :id,
    :customer_number,
    :customer_number1,
    :customer_number2,
    :house_hold_income,
    :house_hold_debt,
    :property_number,
    :home_value,
    :loan_amount,
    :interest_rate,
    :loan_term,
    :start_date,
    :property_tax,
    :pmi,
    :home_ins,
    :monthly_hoa,
    :image1,
    :image2,
    :image3,
	:image4,
    :image5

  validates_presence_of :customer_number,
    :house_hold_income,
    :house_hold_debt,
    :property_number,
    :home_value,
    :loan_amount,
    :interest_rate,
    :loan_term,
    :start_date,
    :property_tax,
    :pmi,
    :home_ins,
    :monthly_hoa,
    :image1,
    :image2,
    :image3,
	:image4,
    :image5
  #mount_uploader :image1,:image2,:image3 ImageUploader
  def initialize(attributes = {})
    attributes.each do |name, value|
      if name.to_s.include? 'start_date'
        next
      end
      send("#{name}=", value)
    end
    flattened_date=flatten_date_array(attributes)
    if(flattened_date.count(0) !=3)
      send('start_date=', Date.new(flattened_date[0],flattened_date[1],flattened_date[2]))   
    end
  end
  
  def flatten_date_array(attributes)
    %w(1 2 3).map { |e| attributes["start_date(#{e}i)"].to_i }
  end

  def save
    self.store_image1!
    self.store_image2!
    self.store_image3!
    self.store_image4!
    self.store_image5!
  end

  def persisted?
    false
  end

end