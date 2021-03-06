require 'bundler/setup'
Bundler.setup

require 'coveralls'
Coveralls.wear!

require "rspec"
require "webmock/rspec"
require "stagebloc"

RSpec.configure do |config|

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"
  
end

StageBloc.configure do |c|
  c.client_id = 'stagebloc-client-id'
  c.client_secret = 'stagebloc-client-secret'
end
