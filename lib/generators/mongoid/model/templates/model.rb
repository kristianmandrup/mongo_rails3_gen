class <%= class_name.camelize %> <%= "< #{options[:inherit].capitalize}" if options[:inherit] %>
  include Mongoid::Document
  <%= 'include Mongoid::Versioning' if options[:version] %>
  <%= 'include Mongoid::Timestamps' if options[:timestamps] %>

  <%= model_attributes.map { |a| "field :#{a.name}, :type => #{a.type.capitalize}" }.join("\n") %>   

  <%= model_indexes.map { |name| "index :#{name}, :unique => true" %>     
end
