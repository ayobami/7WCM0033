class Payment < ApplicationRecord
    self.table_name='payment' 
    audited
end