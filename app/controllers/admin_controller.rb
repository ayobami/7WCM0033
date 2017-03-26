class AdminController < ApplicationController
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
  
   def change_password

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
