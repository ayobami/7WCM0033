class AdminController < ApplicationController
  layout 'admin_layout' 
  
 def index
    @properties_count=Property.all.count
    @messages_count=Contact.all.count
    @users_count=User.all.count
    @adverts_count=Advert.all.count
    @news_count=News.all.count
    @transactions_count=Payment.all.count
    get_properties_count
    get_transactions_count
  end
  
  

  def audit_trail
    @audit_trails = nil
    if request.post?
      audit_trail_dto = AuditTrailDTO.new(params[:audit_trail_dto])
      if audit_trail_dto.valid?
        logger.info "Retrieving audit trail between #{audit_trail_dto.start_date} and #{audit_trail_dto.end_date}"
        @audit_trails=AuditTrail.where("created_at >= '#{audit_trail_dto.start_date.to_s(:db)}' AND created_at <= '#{audit_trail_dto.end_date.to_s(:db)}'" )
      end
    end
  end

  def contact
    @contacts=Contact.all
  end
 def news
    @allnews=News.all
  end

  def users
    @all_users=User.all
  end

  def activate_user
    id=params[:id]
    if(id !=nil )
      user = User.find_by(id: id)
      if(user != nil)
      user.status=284
      user.save
      end
    end
	redirect_to :action => 'users'
  end
  
  def deactivate_user
    id=params[:id]
    if(id !=nil )
      user = User.find_by(id: id)
      if(user != nil)
      user.status=285
      user.save
      end
    end
    redirect_to :action => 'users'
  end

  def create_news
    if request.post?
      news_dto=NewsDTO.new(params[:news_dto])
      if news_dto.valid? then
        news=News.new
        news.title=news_dto.title
        news.text=news_dto.text
        news.user_id=session[:user_id]
        news.news_date=DateTime.parse(Time.now.to_s).strftime("%d/%m/%Y %H:%M")
        if(news.valid? && news.save!)
          flash[:action_successful] = "action successful"
          news_dto= NewsDTO.new
        else
          flash[:action_failed] = "action failed"
        end
      else
        flash[:validation_failed] = "validation failed"
      end
      @news_dto=news_dto
    end
  end

  def edit_news
    @news_dto = nil
    time = Time.now.to_s
    @date = DateTime.parse(time).strftime("%d/%m/%Y %H:%M")
    id=params[:id]
    if(id!=nil)
      news=News.find_by(id: id)
      if(news != nil) then
        @news_dto=NewsDTO.new
      @news_dto.title=news.title
      @news_dto.text=news.text
      @news_dto.user_id=news.user_id
      @news_dto.id=news.id
      @news_dto.news_date=news.news_date
      end
    end

    if request.post?
      news_dto=NewsDTO.new(params[:news_dto])
      if news_dto.valid? then
        news=News.find_by(id: news_dto.id)
        news.title=news_dto.title
        news.text=news_dto.text
        if(news.valid? && news.save!)
          flash[:action_successful] = "action successful"
        else
          flash[:action_failed] = "action failed"
        end
      else
        flash[:validation_failed] = "validation failed"
      end
      @news_dto=news_dto
    end
  end

  def delete_news
    id=params[:id]
    News.find(id).destroy
    redirect_to :action => 'news'
  end

  def adverts
    @alladvert=Advert.all
  end
   def create_advert
    if request.post?
      advert_dto=AdvertDTO.new(params[:advert_dto])
      if advert_dto.valid? then
        advert=Advert.new
        advert.title=advert_dto.title
        advert.text=advert_dto.text
        advert.start_date=advert_dto.start_date
        advert.end_date=advert_dto.end_date
        advert.user_id=session[:user_id]
        advert.advert_date=DateTime.parse(Time.now.to_s).strftime("%d/%m/%Y %H:%M")
        if(advert.valid? && advert.save!)
          flash[:action_successful] = "action successful"
          advert_dto= AdvertDTO.new
        else
          flash[:action_failed] = "action failed"
        end
      else
        flash[:validation_failed] = "validation failed"
      end
      @advert_dto=advert_dto
    end
  end

  def edit_advert
    @advert_dto = nil
    time = Time.now.to_s
    @date = DateTime.parse(time).strftime("%d/%m/%Y %H:%M")
    id=params[:id]
    if(id!=nil)
      advert=Advert.find_by(id: id)
      if(advert != nil) then
        @advert_dto=AdvertDTO.new
      @advert_dto.title=advert.title
      @advert_dto.text=advert.text
      @advert_dto.user_id=advert.user_id
      @advert_dto.advert_date=advert.advert_date
      @advert_dto.start_date=advert.start_date
      @advert_dto.end_date=advert.end_date
      @advert_dto.id=advert.id
      end
    end

    if request.post?
      advert_dto=AdvertDTO.new(params[:advert_dto])
      if advert_dto.valid? then
        advert=Advert.find_by(id: advert_dto.id)
        advert.title=advert_dto.title
        advert.text=advert_dto.text
        if(advert.valid? && advert.save!)
          flash[:action_successful] = "action successful"
        else
          flash[:action_failed] = "action failed"
        end
      else
        flash[:validation_failed] = "validation failed"
      end
      @advert_dto=advert_dto
    end
  end

  def delete_advert
	  id=params[:id]
    Advert.find(id).destroy 
    redirect_to :action => 'adverts' 
  end

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
    person.person_type=DictionaryLoader.get_entry_id_by_code('persontype4')
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
    user.role="admin"
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
  
  def get_properties_count
    @property_jan=Property.where('extract(month from property_date) = ?', 1).count
    @property_feb=Property.where('extract(month from property_date) = ?', 2).count
    @property_mar=Property.where('extract(month from property_date) = ?', 3).count
    @property_apr=Property.where('extract(month from property_date) = ?', 4).count
    @property_may=Property.where('extract(month from property_date) = ?', 5).count
    @property_jun=Property.where('extract(month from property_date) = ?', 6).count
    @property_jul=Property.where('extract(month from property_date) = ?', 7).count
    @property_aug=Property.where('extract(month from property_date) = ?', 8).count
    @property_sep=Property.where('extract(month from property_date) = ?', 9).count
    @property_oct=Property.where('extract(month from property_date) = ?', 10).count
    @property_nov=Property.where('extract(month from property_date) = ?', 11).count
    @property_dec=Property.where('extract(month from property_date) = ?', 12).count
  end
  
  def get_transactions_count
    @transaction_jan=Payment.where('extract(month from payment_date) = ?', 1).count
    @transaction_feb=Payment.where('extract(month from payment_date) = ?', 2).count
    @transaction_mar=Payment.where('extract(month from payment_date) = ?', 3).count
    @transaction_apr=Payment.where('extract(month from payment_date) = ?', 4).count
    @transaction_may=Payment.where('extract(month from payment_date) = ?', 5).count
    @transaction_jun=Payment.where('extract(month from payment_date) = ?', 6).count
    @transaction_jul=Payment.where('extract(month from payment_date) = ?', 7).count
    @transaction_aug=Payment.where('extract(month from payment_date) = ?', 8).count
    @transaction_sep=Payment.where('extract(month from payment_date) = ?', 9).count
    @transaction_oct=Payment.where('extract(month from payment_date) = ?', 10).count
    @transaction_nov=Payment.where('extract(month from payment_date) = ?', 11).count
    @transaction_dec=Payment.where('extract(month from payment_date) = ?', 12).count
 end

end
