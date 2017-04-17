class EventDTO
  
  include ActiveModel::Validations

  attr_accessor :name, :description, :created_by, :id, :event_date, :create_date
  
  validates_presence_of  :name, :description
  
  def initialize(attributes = {})
    attributes.each do |name, value|
      if (name.to_s.include? 'event_date' )
        next
      elsif( name.to_s.include? 'create_date' )
        next
      end
      send("#{name}=", value)
    end
    flattened_date=%w(1 2 3).map { |e| attributes["event_date(#{e}i)"].to_i }
      flattened_date2=%w(1 2 3).map { |e| attributes["create_date(#{e}i)"].to_i }
      
      if(flattened_date.count(0) !=3)
        send('event_date=', Date.new(flattened_date[0],flattened_date[1],flattened_date[2]))   
      end
      if(flattened_date2.count(0) !=3)
        send('create_date=', Date.new(flattened_date[0],flattened_date[1],flattened_date[2]))   
      end
  end
  
  def persisted?
    false
  end
  
end