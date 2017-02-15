require 'test_helper'
require 'address'

class AddressTest < ActiveSupport::TestCase
    
    test "can save address" do
        address= Address.new
        address.city='Lagos'
        address.street1='my street'
        address.country=3
        address.state=1
        assert address.save
    end
    
 end
    
