require 'thor-ext'

module MongoMapper
  module Generators
    class SetupGenerator < Rails::Generators::NamedBase
      include Thor::Actions::Extensions
      include MongoDatabase::Generators::Base      
      
      argument :database, :type => :string, :default => 'mongo_db_default'      

      def self.source_root
        @source_root ||= File.expand_path('../templates', __FILE__)
      end

      def create_files
        template "mongo_mapper_db_config.rb" , "config/initializers/mongo_mapper_db_config.rb" 
      end
      
      def configure_gems
        add_gem "mongo_mapper"
      end

    end
  end
end
