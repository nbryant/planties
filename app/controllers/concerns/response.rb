module Response
  def serializer
    object_name = self.class.name.slice(0..self.class.name.index('Controller')-1)
    serializer_name = "#{object_name.singularize}Serializer"
    serializer_name.constantize
  end

  def json_response(object, status = :ok)
    render json: object, status: status
  end
end