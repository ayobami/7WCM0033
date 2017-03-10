class Property < ApplicationRecord
    self.table_name='property' 
    has_one :property_price
    audited
end