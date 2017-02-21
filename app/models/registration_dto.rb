class RegistrationDTO
  EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i

  include ActiveModel::Validations

  attr_accessor :first_name,
    :last_name,
    :middle_name,
    :phone_number,
    :gender,
    :marital_status,
    :religion,
    :birth_date,
    :email,
    :password,
    :password_confirmation,
    :street1,
    :street2,
    :city,
    :state,
    :country,
    :zip_code

  validates :password, :confirmation => true
  validates_length_of :password, :in => 6..20, :on => :create
  validates_presence_of :first_name,
    :last_name,
    :phone_number,
    :gender,
    :marital_status,
    :religion,
    :birth_date,
    :email,
    :password,
    :street1,
    :city,
    :state,
    :country

  validates_format_of :email, with: EMAIL_REGEX
  
  def initialize(attributes = {})
    attributes.each do |name, value|
      if name.to_s.include? 'birth_date'
        next
      end
      send("#{name}=", value)
    end
    flattened_date=flatten_date_array(attributes)
    send('birth_date=', Date.new(flattened_date[0],flattened_date[1],flattened_date[2]))   
  end
  
  def flatten_date_array(attributes)
    %w(1 2 3).map { |e| attributes["birth_date(#{e}i)"].to_i }
  end
  
  def persisted?
    false
  end
end