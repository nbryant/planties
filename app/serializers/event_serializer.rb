class EventSerializer
  include FastJsonapi::ObjectSerializer
  attributes :created_at, :updated_at
end
