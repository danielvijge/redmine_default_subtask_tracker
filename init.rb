Redmine::Plugin.register :redmine_default_subtask_tracker do
  name 'Default Subtask Tracker'
  author 'Daniel Vijge'
  description 'Set a default tracker for subtasks'
  version '0.1'
  url 'http://www.github.com/danielvijge/redmine_default_subtask_tracker'
  
  #requires_redmine :version_or_higher => '2.0.0'  
  requires_redmine :version => '2.0'..'2.6'  

  t_tracker = Array.new
  Tracker.all.each do |tracker|
    t_tracker[tracker.id] = tracker.id
  end

  settings :default => {
    :default_tracker => t_tracker,
  }, :partial => 'settings/default_subtask_tracker'

end

require 'default_subtask_tracker'
require 'issues_helper_patch'
