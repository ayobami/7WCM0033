class HomeController < ApplicationController
  def index
    get_search_dictionary_entries
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
           render 'index'
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
    render action: 'index'
  end

  def search

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
