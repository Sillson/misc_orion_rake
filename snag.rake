Location.all.each do |loc|
	@nav_setting = (loc.website.widgets.find_by garden_widget_id: 35).navigation.object
	updated_value = @nav_setting.value.each {|k,v| v.update(:child_templates => {})}
	@@nav_setting.update_attributes(:value => updated_value)
end





















