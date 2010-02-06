require 'generators/mongo_db_base'

module MongoMapper
  module Generators
    class SetupGenerator < MongoDatabase::Generators::Base

      def self.source_root
        @source_root ||= File.expand_path('../templates', __FILE__)
      end

      def self.banner
        "#{$0} mongo_mapper:#{generator_name} #{self.arguments.map{ |a| a.usage }.join(' ')} [options]"
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
