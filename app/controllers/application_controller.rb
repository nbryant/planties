class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  def render_json(object)
    render json: serializer.new(object).serialized_json
  end
end