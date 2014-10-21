module StageBloc
  def self.configure
    yield(configuration)

    # add client id to all requests
    API.default_params client_id: configuration.client_id
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  class Configuration
    attr_accessor :client_id, :client_secret
  end
end
