namespace :clean do
	task :snags => :environment do	
		
		Location.all.each do |loc|
			@pages = loc.website.web_page_templates
			@pages.each do |i|
				if i.parent_id?
					i.update(:parent_id => nil)
					i.save
				end
			end
			@nav_setting = (GardenWidget.find_by name: "Navigation").navigation.object
			updated_value = @nav_setting.value.each {|k,v| v.update(:child_templates => {})}
			@nav_setting.update_attributes(:value => updated_value)
		end
	end
end



















