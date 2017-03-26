#encoding: UTF-8

xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
	xml.channel do
		xml.title "Property Managers"
		xml.author "Ayobami Adewole"
		xml.description "Sales of Property, Mortgage"
		xml.link "https://www.ayobamiadewole.com"
		xml.language "en"
		
		for property in @properties
			xml.item do
				xml.title property.short_description
				xml.author "Ayobami Adewole"
				xml.pubDate property.property_date.to_s(:rfc822)
				xml.link "http://localhost:3000/home/property?id=" + property.id.to_s
				xml.guid property.id
				
				text = property.description
				image_path=ImageRetrieval.get_property_main_image_path(property.property_number)
				image_caption = property.short_description
				image_align = ""
				image_tag = "
				<p><img height='200px' width='300px' src='" + image_path +  "' alt='" + image_caption + "' title='" + image_caption + "' align='" + image_align  + "' />
				</p>
				"
				xml.description "
				<p>
					" + text + image_tag+"
				</p>"
			
			end
		end
	end
end