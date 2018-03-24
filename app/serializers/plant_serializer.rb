class PlantSerializer
  include Serialization
  attributes :common_name, :scientific_name, :light
  has_many :event
end
