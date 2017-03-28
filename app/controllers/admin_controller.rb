class AdminController < ApplicationController
  layout 'admin_layout' 
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

end
