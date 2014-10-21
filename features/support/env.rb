require 'bundler/setup'
Bundler.setup

require 'dotenv'
Dotenv.load

require 'stagebloc'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'fixtures/vcr_cassettes'
  c.hook_into :webmock

  c.filter_sensitive_data('<STAGEBLOC_CLIENT_ID>') { ENV.fetch('STAGEBLOC_CLIENT_ID') }
  c.filter_sensitive_data('<STAGEBLOC_CLIENT_SECRET>') { ENV.fetch('STAGEBLOC_CLIENT_SECRET') }
end
