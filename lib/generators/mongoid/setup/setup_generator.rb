# require 'thor-ext'
require 'rails/generators/base'

module Mongoid
  module Generators
    class SetupGenerator < Rails::Generators::Base            
      # include ThorExtensions

      argument :database, :type => :string, :default => 'mongo_db_default'            

      # def configure_gems
      #   cleanup_gemfile
      #   add_gems %w{mongo_ext mongo mongoid}
      # end

      def create_files
        template "mongoid.rb" , "config/initializers/mongoid.rb" 
        template 'database.mongo.yml', "config/database.mongo.yml"   

        puts "Please ensure Gemfile contains: gem 'mongoid'"
      end

      def self.source_root
        @source_root ||= File.expand_path('../templates', __FILE__)
      end

      def self.banner
        "#{$0} mongoid:#{generator_name} #{self.arguments.map{ |a| a.usage }.join(' ')} [options]"
      end

    end
  end
end
