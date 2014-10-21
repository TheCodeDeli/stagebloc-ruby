module StageBloc
  class API # :nodoc:
    include HTTParty
    base_uri 'https://api.stagebloc.com/v1'
  end
end
