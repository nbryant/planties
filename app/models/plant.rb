class Plant < ApplicationRecord
  has_many :event

  validates :common_name, presence: true
  validates :light, presence: true, numericality: {
    only_integer: true,
    less_than_or_equal_to: 10,
  }
  validates :scientific_name, presence: true
end
