require 'rails_helper'

# Test suite for the Todo model
RSpec.describe Plant, type: :model do
  # Validation tests
  # ensure columns title and created_by are present before saving
  it { should validate_presence_of(:scientific_name) }
  it { should validate_presence_of(:common_name) }
  it { should validate_presence_of(:type) }
  it { should validate_presence_of(:light) }
end