require 'generators/mongo_db_base'

module Mongoid
  module Generators
    class SetupGenerator < MongoDatabase::Generators::Base

      def self.source_root
        @source_root ||= File.expand_path('../templates', __FILE__)
      end

      def self.banner
        "#{$0} mongoid:#{generator_name} #{self.arguments.map{ |a| a.usage }.join(' ')} [options]"
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
