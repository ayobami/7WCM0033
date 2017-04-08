class PropertyUtil
  def self.calculate_property_number
    number="10"+get_number
    return number
  end

  def self.calculate_mortgage_number
    number="M"+ get_number
    return number
  end

  def self.get_number
    alphabet='abcdefghijklmnopqrstuvwxyz'
    number=''
    random=Random.new
    6.times{
      index=random.rand(25)
      number+=alphabet.upcase.chars.at(index)
    }
    return number
  end

end