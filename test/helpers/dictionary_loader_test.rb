require 'test_helper'
require 'dictionary_loader'

class DictionaryLoaderTest < ActiveSupport::TestCase
    
    test "can fetch entries" do
        dictionaryLoader=DictionaryLoader.new
        entries=dictionaryLoader.load_all_entries
        assert entries
    end
    
 end