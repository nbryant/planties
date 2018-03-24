require 'rails_helper'

RSpec.describe "Plants", type: :request do
  let(:plant1) { create(:plant, light: 6) }
  let(:plant2) { create(:plant) }

  describe 'GET /plants' do
    it 'returns all plants' do
      [plant1, plant2]
      get '/plants'

      expect(response).to have_http_status(200)
      expect(json['data'][0]['type']).to eq('plant')
      expect(json['data'].map{|d| d['id'].to_i}).to eq([plant1.id, plant2.id])
    end
  end

  describe 'GET /plants/:id' do
    it 'returns proper attributes' do
      get "/plants/#{plant1.id}"

      expect(response).to have_http_status(200)
      expect(json['data']['type']).to eq('plant')
      expect(attr['light']).to eq(6)
      expect(attr.keys).to match_array(%w{ common-name scientific-name light})
    end
  end
end
