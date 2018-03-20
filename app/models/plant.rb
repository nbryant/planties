class Plant < ApplicationRecord
  validates_presence_of :scientific_name,
    :common_name,
    :light
end
