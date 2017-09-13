class AppsController < ApplicationController
  before_action :set_app, only: [:show, :update, :destroy]

  # GET /projects/:project_id/apps
  def index
    @apps = App.where("project_id = ?", params['project_id']).all
    json_response(@apps)
  end

  # POST /projects/:project_id/apps
  def create
    @app = App.create!(params)
    json_response(@app, :created)
  end

  # GET /projects/:project_id/apps/:id
  def show
    json_response(@app)
  end

  # PUT /projects/:project_id/apps/:id
  def update
    @app.update(params)
    head :no_content
  end

  # DELETE /projects/:project_id/apps/:id
  def destroy
    @app.destroy
    head :no_content
  end
  
  def set_app
    @app = App.find("project_id =? AND id=?", params['project_id'], params['id'])
  end
end
