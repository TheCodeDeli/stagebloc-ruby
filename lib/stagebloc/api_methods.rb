module StageBloc
  module APIMethods

    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
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

    def get_attribute(key)
      attributes[key.to_s] || attributes[key.to_sym]
    end

  end
end
