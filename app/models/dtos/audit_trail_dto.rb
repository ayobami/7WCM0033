class AuditTrailDTO
	include ActiveModel::Validations
	
  attr_accessor :start_date, :end_date
  validates_presence_of  :start_date, :end_date
  
  def initialize(attributes = {})
    flattened_date1=flatten_date_array(attributes,'start_date')
    flattened_date2=flatten_date_array(attributes,'end_date')
    if(flattened_date1.count(0) !=3)
      send('start_date=', Date.new(flattened_date1[0],flattened_date1[1],flattened_date1[2]))   
    end
    if(flattened_date2.count(0) !=3)
      send('end_date=', Date.new(flattened_date2[0],flattened_date2[1],flattened_date2[2]))   
    end
  end
  
  def flatten_date_array(attributes, param)
    %w(1 2 3).map { |e| attributes["#{param}(#{e}i)"].to_i }
  end
  
  def persisted?
    false
  end
  
end