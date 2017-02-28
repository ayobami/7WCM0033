
class PortalController < ApplicationController
  
  def property
    @property_dto = nil
    time = Time.now.to_s
    @date = DateTime.parse(time).strftime("%d/%m/%Y %H:%M")
    if request.post?
      property_dto = PropertyDTO.new(params[:property_dto])
      if property_dto.valid?
        property=get_property(property_dto)
        address=get_address(property_dto)
        property_price=get_property_price(property_dto)
        if(property.valid?) 
          address.save
          property.address_id=address.id
          property.property_number=PropertyUtil.calculate_property_number
          property.save
          property_price.property_id=property.id
          property_price.save
          
          #upload image files
          upload_property_images(property_dto,property.property_number)
          
          flash[:action_successful] = "action successful"
          property_dto= PropertyDTO.new  
        else
          flash[:action_failed] = "action failed"  
        end
      else
        flash[:validation_failed] = "validation failed"       
      end      
    @property_dto=property_dto
    else
      @property_dto = PropertyDTO.new
    end
    get_dictionary_entries
  end
  
  private
  
  def get_property(property_dto)
    property=Property.new
    property.description=property_dto.description
    property.property_type=property_dto.property_type
    property.number_of_rooms=property_dto.number_of_rooms
    property.number_of_baths=property_dto.number_of_baths
    property.short_description=property_dto.short_description        
    property.per_unit_price=property_dto.per_unit_price
    property.property_date=@date
    property.property_status=property_dto.property_status
    property.area_size=property_dto.area_size
    return property
  end
  
  def get_property_price(property_dto)
    property_price=PropertyPrice.new       
    property_price.per_unit_price=property_dto.per_unit_price
    property_price.down_payment=property_dto.down_payment
    property_price.mortgage_term=property_dto.mortgage_term
    property_price.interest_rate=property_dto.interest_rate
    property_price.price_date=@date
    property_price.price_status=DictionaryLoader.get_entry_id_by_code("status1")
    return property_price
  end
  
  def get_address(property_dto)
    address=Address.new
    address.street1=property_dto.street1
    address.street2=property_dto.street2
    address.city=property_dto.city
    address.state=property_dto.state
    address.country=property_dto.country
    address.zip_code=property_dto.zip_code
    address.plot_number=property_dto.plot_number
    address.floor_number=property_dto.floor_number
    return address
  end
  
  def get_dictionary_entries
    dictionary_loader=DictionaryLoader.new
    @countries=dictionary_loader.get_entries_by_category("Country")
    @states=dictionary_loader.get_entries_by_category("state")
    @property_types=dictionary_loader.get_entries_by_category("propertytype")
    @property_statuses=dictionary_loader.get_entries_by_category("propertyStatus")
  end
  
  def upload_property_images(property_dto, owner)
    image_uploader=ImageUploader.new(owner)
    image_uploader.store!(property_dto.image1)
    image_uploader.store!(property_dto.image2)
    image_uploader.store!(property_dto.image3)
  end
end
