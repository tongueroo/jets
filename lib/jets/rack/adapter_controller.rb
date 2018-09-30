module Jets::Rack
  class AdapterController < Jets::Controller::Base
    layout false
    internal true
    extend Memoist

    def app
      Proc.new { |env| ['200', {'Content-Type' => 'text/html'}, ['get rack\'d']] }
      # Rails.application
    end

    def rack_env
      builder = Env.new(event)
      builder.build
    end
    memoize :rack_env

    def convert_to_api_gateway(triplet)
      builder = Jets::Rack::ApiGateway.new(triplet)
      builder.build # resp
    end
  end
end