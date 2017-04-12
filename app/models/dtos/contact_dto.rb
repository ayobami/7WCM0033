class ContactDTO
  EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i

  include ActiveModel::Validations

  attr_accessor :surname, :first_name, :email_address, :message, :appointment_date

  validates_presence_of  :surname, :first_name, :email_address, :message, :appointment_date


  validates_format_of :email_address, with: EMAIL_REGEX
  
  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end
  
  def persisted?
    false
  end
  
end