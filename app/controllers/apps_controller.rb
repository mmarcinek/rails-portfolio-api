class AppsController < ApplicationController
  before_action :set_app, only: [:show, :update, :destroy]

  # GET /projects/:project_id/apps
  def index
    @apps = App.where("project_id =? ", params['project_id']).all
    json_response(@apps)
  end

  # POST /projects/:project_id/apps
  def create
    @app = App.create!(app_params)
    @app.project_id = params['project_id']
    @app.save!

    json_response(@app, :created)
  end

  # GET /projects/:project_id/apps/:id
  def show
    json_response(@app)
  end

  # PUT /projects/:project_id/apps/:id
  def update
    @app.update(app_params)
    head :no_content
  end

  # DELETE /projects/:project_id/apps/:id
  def destroy
    if @app = App.where(:project_id => params['project_id']).where(:id => params['id']).first
      @app.destroy
      head :no_content
    else
      json_response( :error => 'An app with that id for does not exist for this project')
    end
  end
  
  def set_app
    @app = App.find(params['id'])
  end

  private
  def app_params
    params.permit(:name)
  end
end
