class PropertyUtil
  
  def self.calculate_property_number
    alphabet='abcdefghijklmnopqrstuvwxyz'
    property_number='10'
    random=Random.new
    6.times{      
      index=random.rand(25)
      property_number+=alphabet.upcase.chars.at(index)
    }
    return property_number
  end

end