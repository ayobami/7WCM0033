class ContactDTO
  EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i

  include ActiveModel::Validations

  attr_accessor :surname, :first_name, :email_address, :message, :appointment_date

  validates_presence_of  :surname, :first_name, :email_address, :message, :appointment_date


  validates_format_of :email_address, with: EMAIL_REGEX
  
  def initialize(attributes = {})
    attributes.each do |name, value|
      if name.to_s.include? 'appointment_date'
        next
      end
      send("#{name}=", value)
    end
    flattened_date=flatten_date_array(attributes)
    if(flattened_date.count(0) !=3)
      send('appointment_date=', Date.new(flattened_date[0],flattened_date[1],flattened_date[2]))   
    end
  end
  
  def flatten_date_array(attributes)
    %w(1 2 3).map { |e| attributes["appointment_date(#{e}i)"].to_i }
  end
  
  def persisted?
    false
  end
  
end