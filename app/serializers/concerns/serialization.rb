module Serialization
  extend ActiveSupport::Concern
  include FastJsonapi::ObjectSerializer

  included do
    set_key_transform :dash
  end
end
