class ImageRetrieval
  
  def self.get_property_main_image_path(property_number)
    path=""
    file=FileModel.find_by(owner_unique_id: property_number)
    if(file!=nil)
       path="/public/uploads/property_image/#{file.file_name}.#{file.extension}"
    end
  end
  
  def self.get_property_images_path(property_number)
    paths=Array.new
    files=FileModel.where(owner_unique_id: property_number)
    files.each{
      |f|
      paths.push("/public/uploads/property_image/#{f.file_name}.#{f.extension}")
    }
    return paths
  end
  
end