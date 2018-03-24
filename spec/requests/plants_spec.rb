require 'rails_helper'

RSpec.describe "Plants", type: :request do
  let(:plant) { create(:plant, light: 6) }

  describe "GET /plants/:id" do
    it "returns proper attributes" do
      get "/plants/#{plant.id}"

      expect(response).to have_http_status(200)
      expect(attr['light']).to eq(6)
      expect(attr.keys).to match_array(%w{ common_name scientific_name light})
    end
  end
end
