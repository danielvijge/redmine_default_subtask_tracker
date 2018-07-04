Redmine::Plugin.register :redmine_default_subtask_tracker do
  name 'Default Subtask Tracker'
  author 'Daniel Vijge'
  description 'Set default trackers for subtasks'
  version '0.2'
  url 'http://www.github.com/eurailcom/redmine_default_subtask_tracker'
  
  requires_redmine :version_or_higher => '2.0.0'  
  #requires_redmine :version => '2.0'..'2.6'  

  settings :default => {
    :default_tracker => 1,
    :subtask_enabled => 1
  }, :partial => 'settings/default_subtask_tracker'

  settings[:default][:default_tracker] = Hash.new
  settings[:default][:subtask_enabled] = Hash.new
  Tracker.all.each do |tracker|
    settings[:default][:default_tracker][tracker.id.to_s] = tracker.id.to_s
    settings[:default][:subtask_enabled][tracker.id.to_s] = "1"
  end

end

require 'default_subtask_tracker'
require 'issues_helper_patch'
