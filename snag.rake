namespace :clean do
	task :snags => :environment do	
		
		Location.all.each do |loc|
			@pages = loc.website.web_page_templates
			@pages.each do |i|
				i.update_attribute(:parent_id, nil) if i.parent_id?
			end
			nav_id = (GardenWidget.find_by name: "Navigation").id
			@nav_setting = (loc.website.widgets.find_by garden_widget_id: nav_id).navigation.object
			updated_value = @nav_setting.value.each {|k,v| v.update(:child_templates => {})}
			@nav_setting.update_attributes(:value => updated_value)
		end
	end
end



















