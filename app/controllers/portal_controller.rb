class PortalController < ApplicationController
  layout 'admin_layout' 
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

  def edit_property
    @property_dto = nil
    time = Time.now.to_s
    @date = DateTime.parse(time).strftime("%d/%m/%Y %H:%M")
    id=params[:id]
    if(id!=nil)
      @property_dto=get_property_dto(id)
    end

    if request.post?
      property_dto = PropertyDTO.new(params[:property_dto])
      if property_dto.valid?
        property= Property.find_by(id: property_dto.id)
        property.description=property_dto.description
        property.property_type=property_dto.property_type
        property.number_of_rooms=property_dto.number_of_rooms
        property.number_of_baths=property_dto.number_of_baths
        property.short_description=property_dto.short_description
        property.per_unit_price=property_dto.per_unit_price
        property.customer_number=property_dto.customer_number
        property.property_status=property_dto.property_status
        property.area_size=property_dto.area_size
        property.save!

        address=Address.find_by(id: property.address_id)
        address.street1=property_dto.street1
        address.street2=property_dto.street2
        address.city=property_dto.city
        address.state=property_dto.state
        address.country=property_dto.country
        address.zip_code=property_dto.zip_code
        address.plot_number=property_dto.plot_number
        address.floor_number=property_dto.floor_number
        address.save!

        property_price=PropertyPrice.find_by(property_id: property.id)
        property_price.per_unit_price=property_dto.per_unit_price
        property_price.down_payment=property_dto.down_payment
        property_price.mortgage_term=property_dto.mortgage_term
        property_price.interest_rate=property_dto.interest_rate
        property_price.save!

        flash[:action_successful] = "action successful"
      else
        flash[:validation_failed] = "validation failed"
      end
      @property_dto=property_dto
    end

    get_dictionary_entries
  end
  
 def mortgages
    @mortgages=Mortgage.all
  end
  
  def mortgage_evaluation
    id=params[:id]
    if(id!=nil)
      @mortgage=Mortgage.find_by(id: id)
    else
      redirect_to :action => 'mortgages' 
    end
  end

  def properties
    @all_properties=Property.all
  end

  def property_evaluation
    @property_evaluation_dto = nil
    time = Time.now.to_s
    @date = DateTime.parse(time).strftime("%d/%m/%Y %H:%M")
    if request.post?
      property_evaluation_dto = PropertyEvaluationDTO.new(params[:property_evaluation_dto])
      if(property_evaluation_dto.valid?)
        property= Property.find_by(property_number: property_evaluation_dto.property_number)
        if(property!=nil)
          property_evaluation =PropertyEvaluation.new
          property_evaluation.property_id= property.id
          property.customer_number=property_dto.customer_number
          property_evaluation.instructions= property_evaluation_dto.instructions
          property_evaluation.site_area= property_evaluation_dto.site_area
          #property_evaluation.number_of_rooms= property_evaluation_dto.number_of_rooms
          #property_evaluation.number_of_baths= property_evaluation_dto.number_of_baths
          property_evaluation.zoning= property_evaluation_dto.zoning
          property_evaluation.comments= property_evaluation_dto.comments
          property_evaluation.terms_of_reference= property_evaluation_dto.terms_of_reference
          property_evaluation.date_of_inspection= property_evaluation_dto.date_of_inspection
          property_evaluation.date_of_valuation= property_evaluation_dto.date_of_valuation
          property_evaluation.land_value= property_evaluation_dto.land_value
          property_evaluation.improvements= property_evaluation_dto.improvements
          property_evaluation.market_valuation= property_evaluation_dto.market_valuation
          property_evaluation.registered_proprietor= property_evaluation_dto.registered_proprietor
          property_evaluation.land_dimensions= property_evaluation_dto.land_dimensions
          property_evaluation.land_area= property_evaluation_dto.land_area
          property_evaluation.encumberances= property_evaluation_dto.encumberances
          property_evaluation.topography= property_evaluation_dto.topography
          property_evaluation.services= property_evaluation_dto.services
          property_evaluation.environmental_issues= property_evaluation_dto.environmental_issues
          property_evaluation.location= property_evaluation_dto.location
          property_evaluation.dwelling_description= property_evaluation_dto.dwelling_description
          property_evaluation.construction= property_evaluation_dto.construction
          property_evaluation.pc_items= property_evaluation_dto.pc_items
          #property_evaluation.fixture_features= property_evaluation_dto.fixture_features
          property_evaluation.other_improvements= property_evaluation_dto.other_improvements
          property_evaluation.building_areas= property_evaluation_dto.building_areas
          property_evaluation.save
          flash[:action_successful] = "action successful"
          @property_evaluation_dto= PropertyEvaluationDTO.new
        else
          flash[:action_failed] = "action failed"
          @property_evaluation_dto=property_evaluation_dto
        end
      else
        flash[:validation_failed] = "validation failed"
        @property_evaluation_dto=property_evaluation_dto
      end
    end
  end
  
  def evaluation_report
    id=params[:id]
    if(id!=nil)
      @property=Property.find_by(id: id)
      @evaluation=PropertyEvaluation.find_by(property_id: id)
    else
      @property=Property.new
      @evaluation=PropertyEvaluation.new
    end
  end

  private

  def get_property(property_dto)
    property=Property.new
    property.description=property_dto.description
    property.property_type=property_dto.property_type
    property.number_of_rooms=property_dto.number_of_rooms
    property.customer_number=property_dto.customer_number
    property.number_of_baths=property_dto.number_of_baths
    property.short_description=property_dto.short_description
    property.per_unit_price=property_dto.per_unit_price
    property.property_date=@date
    property.property_status=property_dto.property_status
    property.area_size=property_dto.area_size
    return property
  end

  def get_property_dto(id)
    property_dto=PropertyDTO.new
    property= Property.find_by(id: id)
    property_dto.description=property.description
    property_dto.property_type=property.property_type
    property_dto.number_of_rooms=property.number_of_rooms
    property_dto.customer_number=property.customer_number
    property_dto.number_of_baths=property.number_of_baths
    property_dto.short_description=property.short_description
    property_dto.per_unit_price=property.per_unit_price
    property_dto.property_status=property.property_status
    property_dto.area_size=property.area_size
    property_dto.id=property.id

    address=Address.find_by(id: property.address_id)
    property_dto.street1=address.street1
    property_dto.street2=address.street2
    property_dto.city=address.city
    property_dto.state=address.state
    property_dto.country=address.country
    property_dto.zip_code=address.zip_code
    property_dto.plot_number=address.plot_number
    property_dto.floor_number=address.floor_number

    property_price=PropertyPrice.find_by(property_id: property.id)
    property_dto.per_unit_price=property_price.per_unit_price
    property_dto.down_payment=property_price.down_payment
    property_dto.mortgage_term=property_price.mortgage_term
    property_dto.interest_rate=property_price.interest_rate

    return property_dto
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
