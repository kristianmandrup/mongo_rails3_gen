module Mongoid
  module Generators
    class SetupGenerator < Rails::Generators::NamedBase
      argument :database, :type => :string, :default => 'my_db'

      def self.source_root
        @source_root ||= File.expand_path('../templates', __FILE__)
      end

      def create_files
        template "mongoid.rb" , "config/initializers/mongoid.rb" 
        template 'database.mongo.yml', "config/database.mongo.yml"
      end

      def configure_gems
        add_gem "mongoid"
      end

    end
  end
end
