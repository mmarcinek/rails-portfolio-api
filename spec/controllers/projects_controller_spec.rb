require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  # init test data
  let!(:projects) { create_list(:project, 10) }
  let(:project_id) { project.first.id }

  # spec for GET /projects do
  describe 'GET /projects' do
    # make HTTP get request before each 
    before { get '/projects' }

    it 'returns projects' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    endata

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # spec for GET /todos/:id
  describe 'GET /projects/:id' do
    before { get '/projects/#{project_id}' }

    context 'when the record exists' do
      it 'returns the project' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(project_id)
      end

      it 'returns status code 200' do 
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:project_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Project/)
      end
    end

    # Test for POST /projects
    describe 'POST /projects' do
    # valid payload
    let(:valid_attributes) { { title: 'Super Project', created_by: '1' } }

    it 'creates a project' do
      expect(json['title']).to eq('Super Project')
    end 

    it 'returns status code 201' do
      expect(response).to have_http_status(201)
    end 
  end

  context 'when the request is invalid' do 
    before { post '/projects', params: {title: 'Foobar' } }

    it 'returns status code 422' do
      expect(response).to have_http_status(422)
    end

    it 'returns a validation failure message' do
      expect(response.body).to match(/Validation failed: Created by can't be blank/)
    end
  end

  # spec for PUT /projects/:id
  describe 'PUT /projects/:id' do
    let(:valid_attributes) { { title: 'Another Project' } }

    context 'when the record exists' do
      before { put '/projects/#{project_id}', params: valid_attributes }

      it 'updates the record' do 
        expect(response.body).to be_empty
      end 

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end
  # spec or DELETE /project/:id
  describe 'DELETE /projects/:id' do
    before { delete '/projects/#{project_id}' }
    
    it 'returns status code 204' do 
      ecpect(response).to have_http_status(204)
    end
  end
end



