class AccountController < ApplicationController
  layout 'application' 
  def change_password
    @change_password_dto = nil
    if request.post?
      change_password_dto = ChangePasswordDTO.new(params[:change_password_dto])
      if change_password_dto.valid?
        user_id=session[:user_id]
        user = User.find_by(id: user_id)
        if(user != nil)
          encrypted_password= BCrypt::Engine.hash_secret(change_password_dto.old_password, user.salt)
          if(encrypted_password==user.password)
            user.password=BCrypt::Engine.hash_secret(change_password_dto.new_password, user.salt)
            user.save!
            flash[:action_successful]="password changed"
          else
            flash[:action_failed] = "action failed"
          end
        end

      else
        flash[:validation_failed] = "validation failed"
      end
      @change_password_dto=change_password_dto
    end
  end

  def forgot_password
  if request.post?
    email=params[:form]['email']
    if(email !=nil) then      
      user=User.find_by(email_address: email)
      if(user != nil) then
        token="email=#{email}&token=#{user.salt}"
        message="Please click on the link to reset your password http://localhost:3000/account/resetpassword?#{token}"
        send_mail(email, "Password Reset Link", message)
        flash[:action_successful]="password reset"
      end
    else
      flash[:validation_failed] = "validation failed"
    end
  end
  end

  def reset_password
  if request.post?
    id=params[:form]['id']
    new_password=params[:form]['new_password']
    password_confirmation=params[:form]['password_confirmation']
    if(id !=nil && new_password!=nil&& password_confirmation!=nil && password_confirmation==new_password) then    
      user = User.find_by(id: id)
      if(user != nil)
        user.password=BCrypt::Engine.hash_secret(new_password, user.salt)
        user.save!
        flash[:action_successful]="password changed"
      else
        flash[:action_failed] = "action failed"
      end     
    else
      flash[:validation_failed] = "validation failed"
    end
    
  else
    email=params[:email]
    token=params[:token]
    if(email !=nil && token!=nil) then
      user=User.find_by(email_address: email)
      if(user != nil) then
        @id=user.id
      end
    else
      redirect_to :action => 'forgot_password' 
    end
  end
  end
  
  def update_profile
    @registrationDTO = nil
    time = Time.now.to_s
    @date = DateTime.parse(time).strftime("%d/%m/%Y %H:%M")
    if request.post?           
    @registrationDTO=RegistrationDTO.new(params[:registrationDTO])
    else
    user_id=session[:user_id]   
      @registrationDTO = RegistrationDTO.new
    @registrationDTO, address_id =get_person(registrationDTO, user_id)
    @registrationDTO =get_address(registrationDTO, address_id)
  end
    get_dictionary_entries
  end
  
  
  private 
  
  def send_mail(receiver, subject, message)
  Net::SMTP.start('localhost') do |smtp|
    smtp.send_message message, 'registration@propertiesapp.com', receiver
  end
  end
  
   def get_person(registrationDTO, id)
    person=Person.find_by(user_id: id)
    registrationDTO.first_name=person.first_name
    registrationDTO.last_name=person.last_name
    registrationDTO.middle_name=person.middle_name
    registrationDTO.phone_number=person.phone_number
    registrationDTO.gender=person.gender
    registrationDTO.marital_status=person.marital_status
    registrationDTO.religion=person.religion
    registrationDTO.birth_date=person.birth_date
    registrationDTO.email_address=person.email
    return registrationDTO,person.address_id
  end
  
   def get_address(registrationDTO, id)
    address=Address.find_by(id: id)
    registrationDTO.street1=address.street1
    registrationDTO.street2=address.street2
    registrationDTO.city=address.city
    registrationDTO.state=address.state
    registrationDTO.country=address.country
    registrationDTO.zip_code=address.zip_code
    return registrationDTO
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

end
