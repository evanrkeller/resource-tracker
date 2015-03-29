class ProjectsController < ApplicationController

  def index
    @projects = pivotal_tracker_api.projects
  end

  def show
    @project = pivotal_tracker_api.project(params[:id])
  end

  private

  def pivotal_tracker_api
    TrackerApi::Client.new(token: ENV['PIVOTAL_TRACKER_TOKEN'])
  end

end
