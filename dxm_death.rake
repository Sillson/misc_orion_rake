## Deprecated. The widget_setting:edit ["Footer Info", "display_dxm", false] rake command should accomplish the same result. 

## Known issue with BOTH solutions is that although the setting will be altered and logo will be removed, the box will be still checked in the widget,
## therefore any subsuquent save will overrwrite the alteration with the logo unless manually unchecked. 

namespace :clean do
  desc "Removes all DXM logo displays from footers"
  task :dxm_death => environment do

    footer_widget_id = (GardenWidget.find_by name: "Footer Info").id

    Location.all.each do |loc|
      @footer_settings = (loc.website.widgets.find_by garden_widget_id: footer_widget_id).settings
      @footer_settings.each do |set| 
        if set["name"] == "display_dxm"
           set["value"] = false)
           set.save!
        end
      end
    end
  end
end


