CarrierWave.configure do |config| 
  config.permissions = 0666
  config.storage = :file
  config.enable_processing = false
 
end