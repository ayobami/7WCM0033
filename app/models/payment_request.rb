class PaymentRequest < ApplicationRecord
    self.table_name='payment_request'     
    audited 
end