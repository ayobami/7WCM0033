class Event < ApplicationRecord
  self.table_name='event'
  
  
  def start_time
    return event_date
  end
end
