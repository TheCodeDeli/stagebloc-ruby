Given(/^I've added my credentials$/) do
  StageBloc.configure do |c|
    c.client_id = ENV.fetch('STAGEBLOC_CLIENT_ID')
    c.client_secret = ENV.fetch('STAGEBLOC_CLIENT_SECRET')
  end
end
