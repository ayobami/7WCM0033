class Address < ApplicationRecord
    self.table_name='address'
    attr_accessor :street1,
    :street2,
    :city,
    :state,
    :country,
    :zip_code

end