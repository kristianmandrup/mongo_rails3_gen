module MongoMapper
  module Generators
    class ModelGenerator < Rails::Generators::NamedBase
      argument :attributes, :type => :array, :default => [], :banner => "field:type field:type"  

      def self.source_root
        @source_root ||= File.expand_path('../templates', __FILE__)
      end

      def create_model_file
        template 'model.rb', File.join('app/models', class_path, "#{file_name}.rb")
      end

      # hook_for :test
    end
  end
end