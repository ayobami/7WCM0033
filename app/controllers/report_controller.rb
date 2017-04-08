class ReportController < ApplicationController
  layout 'admin_layout'
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
    get_mortgages_count
    get_properties_count
    get_transactions_count
    get_users_count
  end
  
  private
  
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
 
 def get_users_count
    @users_jan=User.where('extract(month from created_date) = ?', 1).count
    @users_feb=User.where('extract(month from created_date) = ?', 2).count
    @users_mar=User.where('extract(month from created_date) = ?', 3).count
    @users_apr=User.where('extract(month from created_date) = ?', 4).count
    @users_may=User.where('extract(month from created_date) = ?', 5).count
    @users_jun=User.where('extract(month from created_date) = ?', 6).count
    @users_jul=User.where('extract(month from created_date) = ?', 7).count
    @users_aug=User.where('extract(month from created_date) = ?', 8).count
    @users_sep=User.where('extract(month from created_date) = ?', 9).count
    @users_oct=User.where('extract(month from created_date) = ?', 10).count
    @users_nov=User.where('extract(month from created_date) = ?', 11).count
    @users_dec=User.where('extract(month from created_date) = ?', 12).count
 end
 
 def get_mortgages_count
    @mortgages_jan=Mortgage.where('extract(month from start_date) = ?', 1).count
    @mortgages_feb=Mortgage.where('extract(month from start_date) = ?', 2).count
    @mortgages_mar=Mortgage.where('extract(month from start_date) = ?', 3).count
    @mortgages_apr=Mortgage.where('extract(month from start_date) = ?', 4).count
    @mortgages_may=Mortgage.where('extract(month from start_date) = ?', 5).count
    @mortgages_jun=Mortgage.where('extract(month from start_date) = ?', 6).count
    @mortgages_jul=Mortgage.where('extract(month from start_date) = ?', 7).count
    @mortgages_aug=Mortgage.where('extract(month from start_date) = ?', 8).count
    @mortgages_sep=Mortgage.where('extract(month from start_date) = ?', 9).count
    @mortgages_oct=Mortgage.where('extract(month from start_date) = ?', 10).count
    @mortgages_nov=Mortgage.where('extract(month from start_date) = ?', 11).count
    @mortgages_dec=Mortgage.where('extract(month from start_date) = ?', 12).count
 end



end
