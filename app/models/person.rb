class Person < ApplicationRecord
    self.table_name='person'
       
    attr_accessor :first_name,
    :last_name,
    :middle_name,
    :phone_number,
    :gender,
    :marital_status,
    :religion,
    :birth_date,
    :email,
    :person_type
end