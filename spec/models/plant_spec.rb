require 'rails_helper'

RSpec.describe Plant, type: :model do
  # Validation tests
  # ensure columns title and created_by are present before saving
  context 'validations' do
    it { should validate_presence_of(:scientific_name) }
    it 'common_name' do
      should validate_presence_of(:common_name)
    end

    it 'light' do
      should validate_presence_of(:light)
      should validate_numericality_of(:light).only_integer.is_less_than_or_equal_to(10)
    end
  end
end
