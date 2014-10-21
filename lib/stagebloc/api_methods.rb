module StageBloc
  # == StageBloc::APIMethods
  #
  # Provides methods for creating methods for a +Hash+.
  #
  #   class SomeEndpoint < Struct.new(:attributes)
  #     include StageBloc::APIMethods
  #
  #     has_attribute :first_name
  #   end
  #
  #   endpoint = SomeEndpoint.new(first_name: 'Bob')
  #   endpoint.first_name #=> 'Bob'
  module APIMethods

    def self.included(base) # :nodoc:
      base.extend(ClassMethods)
    end

    module ClassMethods

      # Defines getter methods for a attributes.
      #
      #   class SomeEndpoint < Struct.new(:attributes)
      #     include StageBloc::APIMethods
      #
      #     has_attributes :first_name, :last_name
      #     has_attribute :age
      #   end
      def has_attribute(*keys)
        keys.each do |key|
          class_eval %Q{
            def #{key}
              get_attribute('#{key}')
            end
          }
        end
      end
      alias_method :has_attributes, :has_attribute
    end

    # Returns the value from a hash from +key+.
    #
    # Keys can be strings or symbols.
    #
    #   endpoint = SomeEndpoint.new('first_name' => 'Bob')
    #   endpoint.get_attribute(:first_name) #=> 'Bob'
    def get_attribute(key)
      attributes[key.to_s] || attributes[key.to_sym]
    end

  end
end
