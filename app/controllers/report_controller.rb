class ReportController < ApplicationController
  layout 'admin' 
  
  def properties
	@properties=Property.all
  end

  def users
	@users=User.all
  end

  def mortgages
	@mortgages=Mortgage.all
  end
  
  def purchases
	@purchases=Purchase.all
  end
  
  def analytics
    @properties=Property.all
	@mortgages=Mortgage.all
	@purchases=Purchase.all
  end
  
end
