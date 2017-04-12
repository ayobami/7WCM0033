class Property < ApplicationRecord
    self.table_name='property'  #mapping to the database table
    has_one :property_price
    audited #audit all CRUD activities on the model
end