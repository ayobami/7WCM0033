class ChatRequest  < ApplicationRecord
    self.table_name='chat_request'
    has_many :messages, dependent: :destroy
    audited
end