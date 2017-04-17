require 'securerandom'

module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_session
 
    def connect
      self.current_session = SecureRandom.uuid
    end
 
  end
end