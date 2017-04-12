class Message < ApplicationRecord
    self.table_name='message' 
    audited
end