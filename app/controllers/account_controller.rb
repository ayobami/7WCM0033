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

  end

  def forgot_password_confirmation

  end

  def reset_password

  end

  def reset_password_confirmation

  end
end
