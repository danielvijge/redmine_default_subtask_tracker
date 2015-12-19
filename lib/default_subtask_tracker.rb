
module DefaultSubtaskTracker
  module Helpers
    def self.get_attrs(parent_issue)
      attrs = {:parent_issue_id => parent_issue.id}
      settings = Setting['plugin_redmine_default_subtask_tracker'] || {}
      settings = {} if settings == ""
      
      default_tracker = settings['default_tracker'][parent_issue.tracker.id.to_s]
      attrs[:tracker_id] = default_tracker
      return attrs
    end
  end
end 
