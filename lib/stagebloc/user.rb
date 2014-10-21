module StageBloc
  # == StageBloc::User
  #
  # Wraps the users endpoint in the StageBloc API.
  # https://stagebloc.com/developers/api/v1/users
  #
  #   user = StageBloc::User.find('user-id')
  #   user.name #=> "Test User"
  #
  # === Available Methods
  # - id
  # - url
  # - name
  # - username
  # - bio
  # - color
  # - gender
  # - email
  # - created
  # - birthday
  # - photo
  class User
    include APIMethods
    attr_reader :attributes

    # Accepts user attributes as a Hash.
    #
    #   user = StageBloc::User.new({ id: 'user-id' })
    #   user.id #=> "user-id"
    def initialize(user_hash)
      @attributes = user_hash
    end

    # Finds a StageBloc user by ID.
    # Returns an instance of StageBloc::User
    #
    #   user = StageBloc::User.find('user-id')
    #   user.name #=> "Test User"
    def self.find(user_id)
      response = API.get("/users/#{user_id}")
      User.new(response.parsed_response['data'])
    end

    has_attributes :id, :url, :name, :username, :bio,
                   :color, :gender, :email

    # Returns +created+ as a +Time+.
    def created
      Time.parse(get_attribute(:created))
    end

    # Returns +birthday+ as a +Time+.
    def birthday
      Time.parse(get_attribute(:birthday))
    end

    # Formats the photo images hash.
    #
    # - +:thumbnail_url+
    # - +:small_url+
    # - +:medium_url+
    # - +:large_url+
    # - +:original_url+
    #
    #     user.photo[:large_url] #=> "http://stagebloc.dev/large-image.jpg"
    def photo
      user_photos = get_attribute(:photo)
      return {} if user_photos.nil?
      images = user_photos['images']
      {
        thumbnail_url:   images['thumbnail_url'],
        small_url:       images['small_url'],
        medium_url:      images['medium_url'],
        large_url:       images['large_url'],
        original_url:    images['original_url'],
      }
    end

  end
end
