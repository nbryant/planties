require 'rails_helper'

RSpec.describe "Events", type: :request do
  let(:plant) { create(:plant) }
  let(:event) { create(:event, plant: plant) }

  describe "GET /events" do
    it "works! (now write some real specs)" do
      get "/events/#{event.id}"
      expect(response).to have_http_status(200)
    end
  end
end
