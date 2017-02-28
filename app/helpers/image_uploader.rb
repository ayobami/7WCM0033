require 'securerandom'

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file
  after :store, :persist_file

  process :resize_to_fit => [800, 800]

  #version :thumb do
  #  process :resize_to_fill => [200,200]
  #end
  
  def initialize(owner_id)
    @owner=owner_id
  end
  
  def filename
    @new_file_name=SecureRandom.uuid
    "#{@new_file_name}.#{file.extension}" if original_filename.present?
  end

  def store_dir
    'public/uploads/property_image'
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
  
  def persist_file(owner_id)
    file_model=FileModel.new
    file_model.extension=file.extension
    file_model.file_name=@new_file_name
    file_model.title=original_filename
    file_model.owner_unique_id=@owner
    file_model.save
  end
end