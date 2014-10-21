module StageBloc
  # Set configuration options for API requests.
  #
  #   StageBloc.configure do |c|
  #     c.client_id = ENV.fetch('STAGEBLOC_CLIENT_ID')
  #     c.client_secret = ENV.fetch('STAGEBLOC_CLIENT_SECRET')
  #   end
  def self.configure
    yield(configuration)

    # add client id to all requests
    API.default_params client_id: configuration.client_id
  end

  # Returns an instance of StageBloc::Configuration
  def self.configuration
    @configuration ||= Configuration.new
  end

  # == StageBloc::Configuration
  #
  # Configuration options for StageBloc API client.
  #
  #   StageBloc.configure do |c|
  #     c.client_id = ENV.fetch('STAGEBLOC_CLIENT_ID')
  #     c.client_secret = ENV.fetch('STAGEBLOC_CLIENT_SECRET')
  #   end
  class Configuration
    # StageBloc Authentication Details
    attr_accessor :client_id, :client_secret
  end
end
