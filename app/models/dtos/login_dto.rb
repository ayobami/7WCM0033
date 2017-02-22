class LoginDTO
  EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i

  include ActiveModel::Validations

  attr_accessor :email, :password

  validates_presence_of  :email,:password

  validates_format_of :email, with: EMAIL_REGEX
  
  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end
  
  def persisted?
    false
  end
  
end