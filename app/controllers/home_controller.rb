class HomeController < ApplicationController
  def index

  end

  def registration
    @user = nil
    if request.post?
      registrationDTO = RegistrationDTO.new(params[:registrationDTO])
      if registrationDTO.valid?
        person=get_person(registrationDTO)
        address=get_address(registrationDTO)
        address.save!
        person.save!
      else
        flash[:validation_failed] = "validation failed"
        @registrationDTO=registrationDTO
      end
    else
      @user = User.new
    end
    get_dictionary_entries
  end

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
    person.email=registrationDTO.email
    person.person_type=34
    return person
  end
  
  def person_params
    params.require(:registrationDTO).permit(:first_name,
    :last_name,
    :middle_name,
    :phone_number,
    :gender,
    :marital_status,
    :religion,
    :email,
    :person_type)
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

  def get_dictionary_entries
    dictionaryLoader=DictionaryLoader.new
    @gender=dictionaryLoader.get_entries_by_category("gender")
    @countries=dictionaryLoader.get_entries_by_category("Country")
    @state=dictionaryLoader.get_entries_by_category("state")
    @title=dictionaryLoader.get_entries_by_category("salutation")
    @religion=dictionaryLoader.get_entries_by_category("religion")
    @marital_status=dictionaryLoader.get_entries_by_category("maritalstatus")
  end

  def login
    salt = BCrypt::Engine.generate_salt
    username = params[:username]
    password = params[:password]
    encrypted_password= BCrypt::Engine.hash_secret(password, salt)
    user = User.find_by(username: username)
    if(user != null)
    if(user.password==encrypted_password)

    end
    end
  end

  def search

  end

end
