require 'time'

class HomeController < ApplicationController
  layout 'application' 
  def index
    get_search_dictionary_entries
    @latest_properties=Property.order(id: :desc).take(4)
  end

  def registration
    @registrationDTO = nil
    time = Time.now.to_s
    @date = DateTime.parse(time).strftime("%d/%m/%Y %H:%M")
    if request.post?
      registrationDTO = RegistrationDTO.new(params[:registrationDTO])
      if registrationDTO.valid?
        person=get_person(registrationDTO)
        address=get_address(registrationDTO)
        user=get_user(registrationDTO)
        if(user.valid? && user.save!) #save other entities only if the user account is unique
          address.save
          person.user_id=user.id
          person.address_id=address.id
          person.save
          flash[:action_successful] = "action successful"
          registrationDTO= RegistrationDTO.new  
        else
          flash[:action_failed] = "action failed"  
        end
      else
        flash[:validation_failed] = "validation failed"       
      end      
    @registrationDTO=registrationDTO
    else
      @registrationDTO = RegistrationDTO.new
    end
    get_dictionary_entries
  end

  

  def login
    @loginDTO = nil
    if request.post?
      loginDTO = LoginDTO.new(params[:loginDTO])
      if loginDTO.valid?
        
        user = User.find_by(email_address: loginDTO.email)
        if(user != nil)
          encrypted_password= BCrypt::Engine.hash_secret(loginDTO.password, user.salt)
          if(encrypted_password==user.password)
           session[:user_id] = user.id
           if user.role == "admin"
             redirect_to :controller => 'admin', :action => 'index' 
           else
             redirect_to :action => 'index' 
           end
           
          end
        end 
        flash[:action_failed] = "action failed"
      else
        flash[:validation_failed] = "validation failed" 
      end
      @loginDTO=loginDTO
    end   
  end
  
  def logout
    session[:user_id] =nil
    redirect_to :action => 'index'     
  end
  
  def property
    id=params[:id]
    if(id!= nil)
      @property=Property.find_by(id: id)
    else
      redirect_back fallback_location: index
    end
  end

  def search
    get_search_dictionary_entries
    get_dictionary_entries
    @search_result=nil
    @search_dto =nil    
    if request.post?
      search_dto = SearchDTO.new(params[:search_dto])
      query=search_dto.get_query
      if(query.size>0)
       @search_result=Property.where(query)
      end
      if session[:user_id] != nil
        if(search_dto.save_search || search_dto.is_interest)
          property_search=PropertySearch.new
          property_search.number_of_rooms=search_dto.no_of_rooms
          property_search.number_of_baths=search_dto.no_of_baths
          property_search.price_range_start=search_dto.min_price
          property_search.price_range_end=search_dto.max_price
          property_search.user_id=session[:user_id]
          time = Time.now.to_s
          @date = DateTime.parse(time).strftime("%d/%m/%Y %H:%M")
          property_search.search_date=@date
          property_search.is_interest=search_dto.is_interest.to_i==1? 'YES' : 'NO'
          property_search.save
        end
      end
      @search_dto=search_dto
    end 
  end
  
  def show_room
    @properties=Property.all
  end
  
  def latest_properties
    time_range=Time.now
    time_range=time_range - (60 * 60 * 240) # properties added in the last 10 days
    @latest_properties=Property.where(["property_date >= ?", time_range])
  end
  
  def featured_properties
    @featured_properties=Property.where(property_status: 388) # featured properties
  end
  
 def contact
    if request.post?
      contact_dto=ContactDTO.new(params[:contact_dto])
      if contact_dto.valid? then
        contact=Contact.new
        contact.surname=contact_dto.surname
        contact.first_name=contact_dto.first_name
        contact.email_address=contact_dto.email_address
        contact.message=contact_dto.message
        contact.message_date=DateTime.parse(Time.now.to_s).strftime("%d/%m/%Y %H:%M")
        if(contact.valid? && contact.save!)
          flash[:action_successful] = "action successful"
          contact_dto= ContactDTO.new
        else
          flash[:action_failed] = "action failed"
        end
      else
        flash[:validation_failed] = "validation failed"
      end
      @contact_dto=contact_dto
    end
  end
  
  def chat
    
  end
  
  def feed
    @properties = Property.all
    respond_to do |format|
      format.rss { render :layout => false }
    end
  end
  
  private 
  
  def get_person(registrationDTO)
    person=Person.new
    person.first_name=registrationDTO.first_name
    person.last_name=registrationDTO.last_name
    person.middle_name=registrationDTO.middle_name
    person.phone_number=registrationDTO.phone_number
    person.gender=registrationDTO.gender
    person.marital_status=registrationDTO.marital_status
    person.religion=registrationDTO.religion
    person.birth_date=registrationDTO.birth_date
    person.email_address=registrationDTO.email
    person.registration_date=@date
    person.status=DictionaryLoader.get_entry_id_by_code('requeststatus2')
    person.person_type=DictionaryLoader.get_entry_id_by_code('persontype1')
    return person
  end
  
   def get_address(registrationDTO)
    address=Address.new
    address.street1=registrationDTO.street1
    address.street2=registrationDTO.street2
    address.city=registrationDTO.city
    address.state=registrationDTO.state
    address.country=registrationDTO.country
    address.zip_code=registrationDTO.zip_code
    return address
  end
  
   def get_user(registrationDTO)
    user=User.new
    user.email_address=registrationDTO.email
    user.password=registrationDTO.password
    user.created_date=@date
    user.role="user"
    user.status=284
    return user
  end

  def get_dictionary_entries
    dictionaryLoader=DictionaryLoader.new
    @gender=dictionaryLoader.get_entries_by_category("gender")
    @countries=dictionaryLoader.get_entries_by_category("Country")
    @states=dictionaryLoader.get_entries_by_category("state")
    @titles=dictionaryLoader.get_entries_by_category("salutation")
    @religions=dictionaryLoader.get_entries_by_category("religion")
    @marital_statuses=dictionaryLoader.get_entries_by_category("maritalstatus")
  end
  
  def get_search_dictionary_entries
    @no_of_rooms=[1,2,3,4,5,6,7,8,9,10]
    @no_of_baths=[1,2,3,4,5]
    @price_ranges=["1,000,000","3,000,000","5,000,000","8,000,000","10,000,000"]
  end

end
