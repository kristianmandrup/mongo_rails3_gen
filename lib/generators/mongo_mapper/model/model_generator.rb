require 'rails/generators/base'

module MongoMapper
  module Generators
    class ModelGenerator < Rails::Generators::Base

      argument :model_name, :type => :string, :required => true, :banner => 'ModelName'      
      argument :attributes, :type => :array, :default => [], :banner => "field:type field:type"

      class_option :embedded, :type => :boolean, :aliases => "-E", :default => false,
                              :desc => "Use EmbeddedDocument for model"

      def self.source_root
        @source_root ||= File.expand_path('../templates', __FILE__)
      end

      def self.banner
        "#{$0} mongo_mapper:#{generator_name} #{self.arguments.map{ |a| a.usage }.join(' ')} [options]"
      end

      def create_model_file
        template 'model.rb', File.join('app/models', class_path, "#{file_name}.rb")
      end

      no_tasks do
        def singular_name
          model_name.underscore
        end

        def plural_name
          model_name.underscore.pluralize
        end

        def class_name
          model_name.camelize
        end

        def plural_class_name
          plural_name.camelize
        end
      end
    end
  end
end