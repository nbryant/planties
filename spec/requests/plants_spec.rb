require 'rails_helper'

RSpec.describe 'plants API', type: :request do
  # initialize test data 
  let!(:plants) { create_list(:plant, 10) }
  let(:plant_id) { plants.first.id }

  # Test suite for GET /plants
  describe 'GET /plants' do
    # make HTTP get request before each example
    before { get '/plants' }

    it 'returns plants' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /plants/:id
  describe 'GET /plants/:id' do
    before { get "/plants/#{plant_id}" }

    context 'when the record exists' do
      it 'returns the plant' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(plant_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:plant_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Plant/)
      end
    end
  end

  # Test suite for POST /plants
  describe 'POST /plants' do
    # valid payload
    let(:valid_attributes) do
      {
        scientific_name: 'Learn Elm',
        common_name: 'Fern gully',
        light: 3,
      }
    end

    context 'when the request is valid' do
      before { post '/plants', params: valid_attributes }

      it 'creates a plant' do
        expect(json['scientific_name']).to eq('Learn Elm')
        expect(json['common_name']).to eq('Fern gully')
        expect(json['light']).to eq(3)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/plants', params: { scientific_name: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Common name can't be blank, Light can't be blank/)
      end
    end
  end

  # Test suite for PUT /plants/:id
  describe 'PUT /plants/:id' do
    let(:valid_attributes) { { title: 'Shopping' } }

    context 'when the record exists' do
      before { put "/plants/#{plant_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /plants/:id
  describe 'DELETE /plants/:id' do
    before { delete "/plants/#{plant_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
