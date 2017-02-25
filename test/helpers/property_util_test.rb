require 'test_helper'
require 'property_util'

class PropertyUtilTest < ActiveSupport::TestCase
    
    test "can generate property number" do
        property_number=PropertyUtil.calculate_property_number
        assert property_number
    end
    
 end