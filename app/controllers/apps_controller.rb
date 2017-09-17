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

    uploader = ImageUploader.new
    image = app_params['image']
    uploader.store!(image)

    @app.save!

    json_response(@app, :created)
  end

  # GET /projects/:project_id/apps/:id
  def show
    json_response(@app)
  end

  # PUT /projects/:project_id/apps/:id
  def update
    uploader = ImageUploader.new   
    uploader.store!(:image)

    @app.update(app_params)
    head :no_content  
  end

  # DELETE /projects/:project_id/apps/:id
  def destroy
    if @app
      @app.destroy
      head :no_content
    else
      json_response( :error => 'An app with that id for does not exist for this project')
    end
  end
  
  def set_app
    @app = App.where(:project_id => params['project_id']).where(:id => params['id']).first
  end

  private
  def app_params
    params.permit(:id, :project_id, :name, :description)
  end
end
