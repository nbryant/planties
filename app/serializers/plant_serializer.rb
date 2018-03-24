class PlantSerializer
  include FastJsonapi::ObjectSerializer
  attributes :common_name, :scientific_name, :light
end
