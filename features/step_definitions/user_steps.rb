When(/^I get user information by id$/) do
  VCR.use_cassette('user_by_id') do
    @user = StageBloc::User.find(402218)
  end
end

Then(/^I should have the user's information$/) do
  expect(@user.id).to eq(402218)
  expect(@user.url).to eq('https://stagebloc.com/user/baylorrae')
  expect(@user.created).to eq(Time.new(2014, 7, 15, 21, 36, 16))
  expect(@user.name).to eq("Baylor Rae'")
  expect(@user.username).to eq('baylorrae')
  expect(@user.bio).to eq('')
  expect(@user.color).to eq('70,170,255')
  expect(@user.photo).to eq({})
end
