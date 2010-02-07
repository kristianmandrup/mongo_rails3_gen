require 'generators/mongo_db_base'

module MongoMapper
  module Generators
    class SetupGenerator < Rails::Generators::Base            
      include MongoDatabase::Generators::Base

      argument :database, :type => :string, :default => 'mongo_db_default'            

      def self.source_root
        @source_root ||= File.expand_path('../templates', __FILE__)
      end

      def self.banner
        "#{$0} mongo_mapper:#{generator_name} #{self.arguments.map{ |a| a.usage }.join(' ')} [options]"
      end

      def configure_gems
        add_gems %w{mongo_ext mongo mongo_mapper}
      end

      def create_files
        template "mongo_mapper_db_config.rb" , "config/initializers/mongo_mapper_db_config.rb" 
      end
      
    end
  end
end
