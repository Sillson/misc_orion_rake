class OrphanAnnie
  class << self
    def perform
      fake_orphan_locations = mom_is_that_you
      write_to_loggers("#{fake_orphan_locations}")
      rehome_fake_orphans
      write_to_loggers("There are #{Widget.orphans.count} orphans left.")
      Resque.enqueue(WidgetCleanupJob)
    end

    def fake_orphans
      Widget.orphans.select {|w| !w.parent_widget.nil?}
    end

    def mom_is_that_you
      web_pages = fake_orphans.map {|w| 
        loc = Location.find(w.parent_widget.web_template.website.owner_id)
        [w.id.to_s+": "+w.name,
        w.parent_widget.id.to_s+": "+w.parent_widget.name,
        w.parent_widget.parent_widget.id.to_s+": "+w.parent_widget.parent_widget.name,
        w.parent_widget.web_template.name]
      }
    end

    def rehome_fake_orphans
      fake_orphans.each {|w| self.bind_web_template(w)}
    end

    def bind_web_template(widget)
      widget.update_attribute(:web_template_id, widget.parent_widget.web_template_id)
    end
  end
end