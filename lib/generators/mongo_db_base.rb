require 'rails/generators/namedbase'
require 'thor-ext'

module MongoDatabase
  module Generators
    class Base < Rails::Generators::NamedBase            
        include Thor::Actions::Extensions
        include MongoDatabase::Generators::Base      

        argument :database, :type => :string, :default => 'mongo_db_default'      
      
        def configure_gems
          cleanup_gemfile        
          add_gems(%w{mongo mongo-ext mongoid})        
        end
    end
  end
end

