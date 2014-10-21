module StageBloc
  class User
    include APIMethods
    attr_reader :attributes

    def initialize(user_hash)
      @attributes = user_hash
    end

    def self.find(user_id)
      response = API.get("/users/#{user_id}")
      User.new(response.parsed_response['data'])
    end

    has_attributes :id, :url, :name, :username, :bio,
                   :color, :gender, :email

    def created
      Time.parse(get_attribute(:created))
    end

    def birthday
      Time.parse(get_attribute(:birthday))
    end

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
