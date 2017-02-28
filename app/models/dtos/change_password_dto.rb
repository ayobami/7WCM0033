class ChangePasswordDTO
  
  include ActiveModel::Validations

  attr_accessor :old_password, :new_password, :password_confirmation
  validates_presence_of  :old_password, :new_password, :password_confirmation 
  validates_confirmation_of :new_password
  validates_length_of :new_password, :in => 6..20, :on => :create
  
  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end
  
  def persisted?
    false
  end
  
end