require 'thor-ext'

module MongoDatabase
  module Generators
    module Base
      include ThorExtensions
          
      def configure_gems
        cleanup_gemfile        
        add_gems(%w{mongo mongo-ext mongoid})        
      end
    end
  end
end

