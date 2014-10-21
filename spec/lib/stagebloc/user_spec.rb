require "spec_helper"

module StageBloc
  describe User do

    context "find" do
      it "finds a user by id" do
        stub_request(:get, 'https://api.stagebloc.com/v1/users/user-id?client_id=stagebloc-client-id')
          .to_return(:status => 200, :body => "{}", :headers => { 'Content-Type' => 'application/json' })

        User.find('user-id')
      end

      it "returns a user instance" do
        stub_request(:get, 'https://api.stagebloc.com/v1/users/8?client_id=stagebloc-client-id')
          .to_return(:status => 200, :body => File.read('./fixtures/users/user.json'), :headers => { 'Content-Type' => 'application/json' })

        user = User.find(8)

        expect(user.id).to eq(8)
        expect(user.url).to eq('https://stagebloc.dev/user/testuser')
        expect(user.created).to eq(Time.new(2009, 10, 27, 14, 29, 16))
        expect(user.name).to eq('Test User')
        expect(user.username).to eq('testuser')
        expect(user.bio).to eq('Biography here...')
        expect(user.color).to eq('70,170,255')
        expect(user.birthday).to eq(Time.new(1995, 07, 05))
        expect(user.gender).to eq('male')
        expect(user.email).to eq('testuser@sb.com')

        expect(user.photo[:thumbnail_url]).to eq('thumbnail-photo-url')
        expect(user.photo[:small_url]).to eq('small-photo-url')
        expect(user.photo[:medium_url]).to eq('medium-photo-url')
        expect(user.photo[:large_url]).to eq('large-photo-url')
        expect(user.photo[:original_url]).to eq('original-photo-url')
      end
    end

    context "photo" do
      it "allows nil value" do
        user = User.new({})
        expect(user.photo).to eq({})
      end
    end

  end
end
