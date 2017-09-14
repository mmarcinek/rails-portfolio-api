require 'rails_helper'

RSpec.describe 'Apps API', type: :request do
  let!(:apps) { create_list(:app, 5) }
  let(:id) { apps.first.id }

  # Test spec for GET /projects/:project_id/apps
  describe 'GET /projects/:project_id/apps' do
    before { get '/projects/:project_id/apps' }
    
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /projects/:project_id/apps/:id
  describe 'GET /projects/:project_id/apps/:id' do
    before { get "/projects/:project_id/apps/#{id}" }

    context 'when the record exists' do
      it 'returns project' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find App with 'id'=100/)
      end
    end
  end

  # Test suite for POST /projects/:project_id/apps
  describe 'POST /projects/:project_id/apps' do
    # valid payload
    let(:valid_attributes) { { name: 'Super App' } }

    context 'when the request is valid' do
      before { post '/projects/:project_id/apps', params: valid_attributes }

      it 'creates app' do
        expect(json['name']).to eq('Super App')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/projects/:project_id/apps', params: { name: nil} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  # Test suite for PUT /projects/:project_id/apps/:id
  describe 'PUT /projects/:project_id/apps/:id' do
    let(:valid_attributes) { { name: 'Another Super App' } }

    context 'when the record exists' do
      before { put "/projects/:project_id/apps/#{id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /projects/:project_id/apps/:id
  describe 'DELETE /projects/:project_id/apps/:id' do
    before { delete "/projects/:project_id/apps/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end

end
