# misc_orion_rake

## namespace:clean

## snag.rake

Clears the navigation snags that occur after cloning with parent/child element relationships. Not a product fix, but an interim solution to help get projects out the door, and builders piece of mind. Will iterate over all pages and flush child/parent relationships, then clear out them empty box snags, that will funk up a corp nav on a location (single domain). The builder will be responsible for resetting all page elements.

## death_to_dxm.rake

Deprecated. The widget_setting:edit ["Footer Info", "display_dxm", false] rake command should accomplish the same result. Known issue with BOTH solutions is that although the setting will be altered and logo will be removed, the box will be still checked in the widget, therefore any subsuquent save will overrwrite the alteration with the logo unless manually unchecked. 
