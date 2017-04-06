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
      send("#{name}=", value)
    end
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