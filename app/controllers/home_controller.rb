class HomeController < ApplicationController
  def index
  end
  
  def registration
    @user = User.new 
  end
  
  def register_user
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "You signed up successfully"
      flash[:color]= "valid"
    else
      flash[:notice] = "Form is invalid"
      flash[:color]= "invalid"
    end
    render "registration"
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

end
