class AdvertDTO
  
  include ActiveModel::Validations

  attr_accessor :title, :text, :user_id, :id, :advert_date, :start_date, :end_date, :advert_number
  validates_presence_of  :title, :text
  
  def initialize(attributes = {})
    attributes.each do |name, value|
      if (name.to_s.include? 'start_date' )
        next
      elsif( name.to_s.include? 'end_date' )
        next
      end
      send("#{name}=", value)
    end
    flattened_date=%w(1 2 3).map { |e| attributes["start_date(#{e}i)"].to_i }
      flattened_date2=%w(1 2 3).map { |e| attributes["end_date(#{e}i)"].to_i }
      
      if(flattened_date.count(0) !=3)
        send('start_date=', Date.new(flattened_date[0],flattened_date[1],flattened_date[2]))   
      end
      if(flattened_date2.count(0) !=3)
        send('end_date=', Date.new(flattened_date[0],flattened_date[1],flattened_date[2]))   
      end
  end
  
  def persisted?
    false
  end
  
end