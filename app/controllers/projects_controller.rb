class ProjectsController < ApplicationController

  def index
    pivotal_tracker_api = TrackerApi::Client.new(token: ENV['PIVOTAL_TRACKER_TOKEN'])
    @projects = pivotal_tracker_api.projects
  end

end
