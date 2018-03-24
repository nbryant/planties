class Event < ApplicationRecord
  belongs_to :plant

  validates :plant, presence: true
end
