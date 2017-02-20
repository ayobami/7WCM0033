class HomeController < ApplicationController
  
  
  def index

  end

  def registration
    @user = nil
    if request.post?
      registrationDTO = params[:registrationDTO]
      if @user.save
        flash[:notice] = "You signed up successfully"
        flash[:color]= "valid"
      else
        flash[:notice] = "Form is invalid"
        flash[:color]= "invalid"
      end
    else
      @user = User.new
    end
    get_dictionary_entries
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
