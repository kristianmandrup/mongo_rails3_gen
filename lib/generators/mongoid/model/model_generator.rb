require 'rails/generators/base'

module Mongoid
  module Generators
    class ModelGenerator < Rails::Generators::Base     
      argument :model_name, :type => :string, :required => true, :banner => 'ModelName'            
      argument :attributes, :type => :array, :default => [], :banner => "field:type field:type"  

      class_option :inherit, :type => :string, :aliases => "-I",
                              :desc => "Embed document by Inheriting"

      class_option :version, :type => :boolean, :aliases => "-V", :default => false
                              :desc => "Add versioning"

      class_option :timestamps, :type => :boolean, :aliases => "-T", :default => true
                              :desc => "Add timstamps"
                             
      attr_accessor :model_attributes, :model_indexes
    
      def initialize(*args, &block)
        super

        @model_attributes = []          
        @model_indexes = []

        attributes.each do |arg|
          if arg.include?('#')  
            arg.gsub! /#.*$/, ''            
            @model_indexes << arg.split(':').first
          end
          
          if arg.include?(':')
            @model_attributes << Rails::Generators::GeneratedAttribute.new(*arg.split(':'))
          else
            @model_attributes << Rails::Generators::GeneratedAttribute.new(arg, "string")            
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