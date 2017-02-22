class Property < ApplicationRecord
    self.table_name='property'  
    has_one :address 
end