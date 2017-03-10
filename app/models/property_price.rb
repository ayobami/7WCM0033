class PropertyPrice < ApplicationRecord
    self.table_name='property_price'     
    has_one :property
    audited 
end