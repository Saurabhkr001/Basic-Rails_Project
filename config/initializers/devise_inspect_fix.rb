# Fix Devise inspect issue in Rails console / IRB / Pry
if defined?(Devise::Models::Authenticatable)
  module Devise
    module Models
      module Authenticatable
        def inspect
          "#<#{self.class} id=#{id.inspect}>"
        end
      end
    end
  end
end
