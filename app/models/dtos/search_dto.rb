class SearchDTO
  include ActiveModel::Validations

  attr_accessor :search_text, :min_price, :max_price,:no_of_rooms, :no_of_baths, :property_number, :street1, :city, :zip_code, :state, :saved_search
  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end

  def get_query
    query=" "
    can_add_operator=false
    if(no_of_rooms.size >0)
      query+="number_of_rooms =#{no_of_rooms} "
    can_add_operator=true
    end

    if(no_of_baths.size >0)
      if(can_add_operator)
        query+= "or "
      end
      query+="number_of_baths =#{no_of_baths} "
    can_add_operator=true
    end

    if(property_number != nil)
      if(can_add_operator)
        query+= "or "
      end
      query+="property_number ='#{property_number}' "
    can_add_operator=true
    end

    if(min_price.size >0 && max_price.size >0)
      if(can_add_operator)
        query+= "or "
      end
      query+="per_unit_price >=#{min_price.gsub(','->"")} and per_unit_price <=#{max_price} "
    can_add_operator=true
    elsif(min_price.size >0)
      if(can_add_operator)
        query+= "or "
      end
      query+="per_unit_price >=#{min_price} "
    can_add_operator=true
    elsif(max_price.size >0)
      if(can_add_operator)
        query+= "or "
      end
      query+="per_unit_price <=#{max_price} "
    can_add_operator=true
    end

    return query.strip

  end

end