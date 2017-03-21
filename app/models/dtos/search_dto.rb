class SearchDTO
  include ActiveModel::Validations

  attr_accessor :search_text, :min_price, :max_price,:no_of_rooms, :no_of_baths, :property_number, 
  :street1, :city, :zip_code, :state, :save_search, :is_interest
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
    query, can_add_operator=build_query(query, "number_of_rooms",no_of_rooms,can_add_operator, false, "=")
    query, can_add_operator= build_query(query, "number_of_baths",no_of_baths,can_add_operator, false, "=")
    query, can_add_operator= build_query(query, "property_number",property_number,can_add_operator, false, "=")    

    if(min_price.size >0 && max_price.size >0)
      if(can_add_operator)
        query+= "or "
      end
      query+="(per_unit_price >=#{replace_character(min_price)} and per_unit_price <=#{replace_character(max_price)}) "
      can_add_operator=true
    elsif(min_price.size >0)
      query, can_add_operator= build_query(query, "per_unit_price",min_price,can_add_operator, true, ">=")
    elsif(max_price.size >0)
      query, can_add_operator= build_query(query, "per_unit_price",max_price,can_add_operator, true, "<=")
    end
    
    query+=build_address_query(can_add_operator)
    
    if(query.strip.size>0)
       query+="and property_status in (290,388)" 
    end
    return query.strip
  end
  
  def build_address_query(can_add_operator)
    query=" "
    can_add_operator=false
    query, can_add_operator=build_query(query, "street1",street1,can_add_operator, false, "=")
    query, can_add_operator= build_query(query, "city",city,can_add_operator, false, "=")
    query, can_add_operator= build_query(query, "zip_code",zip_code,can_add_operator, false, "=")   
    query, can_add_operator= build_query(query, "state",state,can_add_operator, false, "=") 
    if(query.strip.size > 0)
       addresses=Address.where(query);
       if(addresses !=nil && addresses.size >0)
         if(can_add_operator)
            query+= "or "
         end
         query="address_id in ("
          addresses.each{
            |address|
            query.concat(address.id.to_s)
            query.concat(",")
          }
          query=query.chop 
          query.concat(") ")
       end
    end
    return query  
  end
  
  def build_query(query,column, field, can_add_operator, should_replace_character,operator)
     if(field!=nil && field.size >0)
       if(can_add_operator)
        query+= "or "
       end
       query+="#{column} #{operator} #{should_replace_character ? replace_character(field) : field} "
       return query, true
     end
    return query, can_add_operator
  end
  
  def replace_character(field)
     return field.gsub(/,/,'')
  end

end