require 'rails/generators/base'

module MongoMapper
  module Generators
    class ModelGenerator < Rails::Generators::Base

      argument :model_name, :type => :string, :required => true, :banner => 'ModelName'      
      argument :attributes, :type => :array, :default => [], :banner => "field:type field:type"

      class_option :embedded, :type => :boolean, :aliases => "-E", :default => false,
                              :desc => "Use EmbeddedDocument for model"

      def initialize(*args, &block)
        super

        @model_attributes = []

        args_for_c_m.each do |arg|
          if arg.include?(':')
            @model_attributes << Rails::Generators::GeneratedAttribute.new(*arg.split(':'))
          end
        end

        @model_attributes.uniq!

        if @model_attributes.empty?
          if model_exists?
            model_columns_for_attributes.each do |column|
              @model_attributes << Rails::Generators::GeneratedAttribute.new(column.name.to_s, column.type.to_s)
            end
          else
            @model_attributes << Rails::Generators::GeneratedAttribute.new('name', 'string')
          end
        end
      end

      def create_model_file
        template 'model.rb', "app/models/#{singular_name}.rb"        
      end

      no_tasks do 
        def model_exists?
          File.exist? destination_path("app/models/#{singular_name}.rb")
        end        
        
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
        
        def model_columns_for_attributes
          class_name.constantize.columns.reject do |column|
            column.name.to_s =~ /^(id|created_at|updated_at)$/
          end
        end        
      end 
      
      def self.source_root
        @source_root ||= File.expand_path('../templates', __FILE__)
      end

      def self.banner
        "#{$0} mongo_mapper:#{generator_name} #{self.arguments.map{ |a| a.usage }.join(' ')} [options]"
      end
      
    end
  end
end