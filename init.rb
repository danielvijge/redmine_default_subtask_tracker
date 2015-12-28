Redmine::Plugin.register :redmine_default_subtask_tracker do
  name 'Default Subtask Tracker'
  author 'Daniel Vijge'
  description 'Set default trackers for subtasks'
  version '0.1'
  url 'http://www.github.com/danielvijge/redmine_default_subtask_tracker'
  
  #requires_redmine :version_or_higher => '2.0.0'  
  requires_redmine :version => '2.0'..'2.6'  

  settings :default => {
    :default_tracker => 1
  }, :partial => 'settings/default_subtask_tracker'

  settings[:default][:default_tracker] = Hash.new
  Tracker.all.each do |tracker|
    settings[:default][:default_tracker][tracker.id.to_s] = tracker.id.to_s
  end

end

require 'default_subtask_tracker'
require 'issues_helper_patch'
