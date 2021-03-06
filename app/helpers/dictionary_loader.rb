require 'dictionary'
require 'dalli'

class DictionaryLoader


	def load_all_entries
	  entries=nil
	  cache = ActiveSupport::Cache::MemCacheStore.new	
	  if(cache.read('entries')==nil)
		  entries=	Dictionary.all
		  cache.write('entries', entries)
		else
		  entries=cache.read('entries')
		end
		return entries
	end 

  def get_entries_by_category(dictionary_category)
    entries=Dictionary.where(category: dictionary_category)
  end
  
  def self.get_entry_by_code(entry_code)
    entry=Dictionary.where(code: entry_code)
  end  
  
  def self.get_entry_id_by_code(entry_code)
    id=0
    entry=Dictionary.where(code: entry_code).first
    if(entry!=nil)
      id=entry.id
    end
    return id
  end 
  
end