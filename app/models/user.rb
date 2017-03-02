class User < ApplicationRecord
  self.table_name='user' 
  audited
  has_one :person  
  validates :email_address, :uniqueness => true
   
  before_save :encrypt_password
  after_save :clear_password
  
  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.password= BCrypt::Engine.hash_secret(password, salt)
    end
  end

  def clear_password
    self.password = nil
  end
end
