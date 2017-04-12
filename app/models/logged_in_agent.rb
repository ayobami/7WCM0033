class LoggedInAgent < ApplicationRecord
    self.table_name='loggedinagent' 
    audited
end