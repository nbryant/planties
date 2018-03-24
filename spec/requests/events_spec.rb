require 'rails_helper'

RSpec.describe "Events", type: :request do
  let(:plant) { create(:plant) }
  let(:event) { create(:event, plant: plant) }
  let(:other_events) do
    5.times { create(:event, plant: plant) }
  end

  describe 'GET /events' do
    it 'returns all events' do
      event
      other_events
      get '/events'

      expect(response).to have_http_status(200)
      expect(json['data'][0]['type']).to eq('event')
      expect(json['data'].length).to eq(6)
    end
  end

  describe 'GET /events/:id' do
    it 'returns proper attributes' do
      get "/events/#{event.id}"

      expect(response).to have_http_status(200)
      expect(json['data']['type']).to eq('event')
    end
  end
end
