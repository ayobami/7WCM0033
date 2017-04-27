require 'time'
require 'securerandom'

class HomeController < ApplicationController
  layout 'application' 
  def index
    get_search_dictionary_entries
    @latest_properties=Property.order(id: :desc).take(3)
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
          flash[:message] = "action successful"
          registrationDTO= RegistrationDTO.new  
        else
          flash[:notice] = "action failed"  
        end
      else
        flash[:alert] = "validation failed"       
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
          if(user.status==284)
            encrypted_password= BCrypt::Engine.hash_secret(loginDTO.password, user.salt)
            if(encrypted_password==user.password)
              session[:user_id] = user.id
              if user.role == "admin"
                LoggedInAgent.where(user_id: user.id).delete_all
                logged_in_agent=LoggedInAgent.new
                logged_in_agent.user_id=user.id
                logged_in_agent.chat_id=SecureRandom.uuid
                logged_in_agent.status="idle"
                logged_in_agent.save
                redirect_to :controller => 'admin', :action => 'index'
              else
                redirect_to :action => 'index'
              end
            else
              flash[:notice] = "action failed"
            end
          else
            flash[:locked] = "account locked"
          end
        else
          flash[:alert] = "validation failed"
        end
      else
        flash[:alert] = "validation failed"
      end
      @loginDTO=loginDTO
    end
  end

  def logout   
    if(session[:user_id] !=nil ) then
      LoggedInAgent.where(user_id: session[:user_id]).delete_all
      session[:user_id] =nil
    end
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
  
  def property_mortgage
    @mortgage_dto = nil
    time = Time.now.to_s
    @date = DateTime.parse(time).strftime("%d/%m/%Y %H:%M")
    if request.post?
      mortgage_dto = MortgageDTO.new(params[:mortgage_dto])
      if(mortgage_dto.valid?)
        property= Property.find_by(property_number: mortgage_dto.property_number)
        if(property!=nil && property.property_status==290) #check if property is not currently mortgaged
          mortgage =Mortgage.new
          mortgage.customer_number1=mortgage_dto.customer_number
          mortgage.customer_number2=mortgage_dto.customer_number1
          mortgage.customer_number3=mortgage_dto.customer_number2
          mortgage.property_number= mortgage_dto.property_number
          mortgage.house_hold_income= mortgage_dto.house_hold_income
          mortgage.home_value= mortgage_dto.home_value
          mortgage.interest_rate= mortgage_dto.interest_rate
          mortgage.loan_term= mortgage_dto.loan_term
          mortgage.start_date= mortgage_dto.start_date
          mortgage.property_tax= mortgage_dto.property_tax
          mortgage.pmi= mortgage_dto.pmi
          mortgage.home_ins= mortgage_dto.home_ins
          mortgage.monthly_hoa= mortgage_dto.monthly_hoa
		      mortgage.mortgage_number=PropertyUtil.calculate_mortgage_number
          mortgage.save
          #update property status
          property.property_status=390
          property.save
          flash[:message] = "action successful"
          @mortgage_dto= MortgageDTO.new
          @mortgage_dto.customer_number=mortgage_dto.customer_number
          
          upload_property_images(mortgage_dto, mortgage.mortgage_number)
        else
          flash[:notice] = "action failed"
          @mortgage_dto=mortgage_dto
        end
      else
        flash[:alert] = "validation failed"
        @mortgage_dto=mortgage_dto
      end
    else
      @mortgage_dto = MortgageDTO.new
      user_id=session[:user_id]
      person=Person.find_by(user_id: user_id)
      @mortgage_dto.customer_number=person.person_number      
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
    @show_room=ShowRoom.first
    @properties=Property.all.take(@show_room.no_of_properties)    
  end
  
  def events
    @meetings=Event.all
  end
  
  def latest_properties
    time_range=Time.now
    time_range=time_range - (60 * 60 * 240) # properties added in the last 10 days
    @latest_properties=Property.where(["property_date >= ?", time_range])
  end
  
  def all_properties
    @latest_properties=Property.all.where("property_type=386").order('id DESC')
  end
  
  def featured_properties
    @featured_properties=Property.where(property_status: 388) # featured properties
  end
  
  def interests
    user_id=session[:user_id]
    @interests=PropertySearch.where(user_id: user_id, is_interest: 'YES') 
  end
  
  def delete_interest
    id=param[:id]
    if(id!=nil) then
      PropertySearch.find(id).destroy
    end
    redirect_to :action => 'interests'
  end
  
  def searches
    user_id=session[:user_id]
    @interests=PropertySearch.where(user_id: user_id, is_interest: 'NO') 
  end
  
  def delete_search
    id=param[:id]
    if(id!=nil) then
      PropertySearch.find(id).destroy
    end
    redirect_to :action => 'searches'
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
        contact.appointment_date=contact_dto.appointment_date
        contact.message_date=DateTime.parse(Time.now.to_s).strftime("%d/%m/%Y %H:%M")
        if(contact.valid? && contact.save!)
          flash[:message] = "action successful"
          contact_dto= ContactDTO.new
        else
          flash[:notice] = "action failed"
        end
      else
        flash[:alert] = "validation failed"
      end
      @contact_dto=contact_dto
    end
  end
  
  def interest_form
    if request.post?
      payment_request_dto=PaymentRequestDTO.new(params[:payment_request_dto])
      if payment_request_dto.valid? then
        payment_request=PaymentRequest.new
        payment_request.surname=payment_request_dto.surname
        payment_request.first_name=payment_request_dto.first_name
        payment_request.email_address=payment_request_dto.email_address
        payment_request.comment=payment_request_dto.comment
        payment_request.property_id=payment_request_dto.property_id
        payment_request.phone_number=payment_request_dto.phone_number
        payment_request.expected_date=payment_request_dto.expected_date
        payment_request.create_date=DateTime.parse(Time.now.to_s).strftime("%d/%m/%Y %H:%M")
        if(payment_request.valid? && payment_request.save!)
          flash[:message] = "action successful"
          payment_request_dto= PaymentRequestDTO.new
          redirect_to :action => 'interest_saved'
        else
          flash[:notice] = "action failed"
        end
      else
        flash[:alert] = "validation failed"
      end
      @payment_request_dto=payment_request_dto
    
  else
    id=params[:id]
    if(id!=nil)
      user_id=session[:user_id]
      if(user_id!=nil) then
         payment_request=PaymentRequest.new
         payment_request.property_id=id
         payment_request.user_id=user_id
         payment_request.create_date=DateTime.parse(Time.now.to_s).strftime("%d/%m/%Y %H:%M")
         payment_request.save
         redirect_to :action => 'interest_saved'
      else
         @payment_request_dto=PaymentRequestDTO.new
         @payment_request_dto.property_id=id
      end
    end   
  end
 end
 
 def interest_saved
   
 end
  
 def chat_request
   if request.post?
    chat_request=ChatRequest.new
    chat_request.full_name=params[:chat_request_dto]['full_name']
    chat_request.email_address=params[:chat_request_dto]['email_address']
    chat_request.chat_date=DateTime.parse(Time.now.to_s).strftime("%d/%m/%Y %H:%M")
    chat_request.chat_id=SecureRandom.uuid
    if(chat_request.full_name !=nil && chat_request.email_address) then
      chat_request.save
      @chat_request=chat_request
      render :chat
    else
      flash[:alert] = "validation failed"
    end
   end
  end
  
  def chat
    user_id=session[:user_id]
    if(user_id!=nil) then
      person =Person.find_by(user_id: user_id)
      chat_request=ChatRequest.new
      chat_request.full_name=person.last_name + " " +person.first_name
      chat_request.email_address=person.email_address
      chat_request.user_id=user_id
      chat_request.chat_date=DateTime.parse(Time.now.to_s).strftime("%d/%m/%Y %H:%M")
      chat_request.chat_id=SecureRandom.uuid
      chat_request.save
    else
      redirect_to :action => 'chat_request' 
    end
  end
  
  def create
    message_dto = MessageDTO.new(params[:message_dto])
    message.inbound = false
    if message.save
      send_cable(message)
      redirect_to "/messages/#{message.number}"
    end
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
  
  
  def upload_property_images(mortgage_dto, owner)
    image_uploader=ImageUploader.new(owner)
    image_uploader.store!(mortgage_dto.image1)
    image_uploader.store!(mortgage_dto.image2)
    image_uploader.store!(mortgage_dto.image3)
    image_uploader.store!(mortgage_dto.image4)
    image_uploader.store!(mortgage_dto.image5)
  end

end
