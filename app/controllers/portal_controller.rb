
class PortalController < ApplicationController
  
  def property
    @propertyDTO = nil
    time = Time.now.to_s
    @date = DateTime.parse(time).strftime("%d/%m/%Y %H:%M")
    if request.post?
      propertyDTO = PropertyDTO.new(params[:propertyDTO])
      if propertyDTO.valid?
        property=get_property(propertyDTO)
        address=get_address(propertyDTO)
        property_price=get_property_price(propertyDTO)
        if(property.valid?) 
          address.save
          property.address_id=address.id
          property.property_number=PropertyUtil.calculate_property_number
          property.save
          property_price.property_id=property.id
          property_price.save
          flash[:action_successful] = "action successful"
          propertyDTO= PropertyDTO.new  
        else
          flash[:action_failed] = "action failed"  
        end
      else
        flash[:validation_failed] = "validation failed"       
      end      
    @propertyDTO=propertyDTO
    else
      @propertyDTO = PropertyDTO.new
    end
    get_dictionary_entries
  end
  
  def get_property(propertyDTO)
    property=Property.new
    property.description=propertyDTO.description
    property.property_type=propertyDTO.property_type
    property.number_of_rooms=propertyDTO.number_of_rooms
    property.number_of_baths=propertyDTO.number_of_baths
    property.short_description=propertyDTO.short_description        
    property.per_unit_price=propertyDTO.per_unit_price
    property.property_date=@date
    property.property_status=propertyDTO.property_status
    property.area_size=propertyDTO.area_size
    return property
  end
  
  def get_property_price(propertyDTO)
    property_price=PropertyPrice.new       
    property_price.per_unit_price=propertyDTO.per_unit_price
    property_price.down_payment=propertyDTO.down_payment
    property_price.mortgage_term=propertyDTO.mortgage_term
    property_price.interest_rate=propertyDTO.interest_rate
    property_price.price_date=@date
    property_price.price_status=DictionaryLoader.get_entry_id_by_code("status1")
    return property_price
  end
  
  def get_address(propertyDTO)
    address=Address.new
    address.street1=propertyDTO.street1
    address.street2=propertyDTO.street2
    address.city=propertyDTO.city
    address.state=propertyDTO.state
    address.country=propertyDTO.country
    address.zip_code=propertyDTO.zip_code
    address.plot_number=propertyDTO.plot_number
    address.floor_number=propertyDTO.floor_number
    return address
  end
  
  def get_dictionary_entries
    dictionaryLoader=DictionaryLoader.new
    @countries=dictionaryLoader.get_entries_by_category("Country")
    @states=dictionaryLoader.get_entries_by_category("state")
    @property_types=dictionaryLoader.get_entries_by_category("propertytype")
    @property_statuses=dictionaryLoader.get_entries_by_category("propertyStatus")
  end
end
