class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  def render_json(object)
    class_name = object.class.name
    serializer = "#{class_name}Serializer".constantize
    render json: serializer.new(object).serialized_json
  end
end