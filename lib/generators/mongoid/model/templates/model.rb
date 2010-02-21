class <%= class_name.camelize %> <%= "< #{options[:inherit].capitalize}" if options[:inherit] %>
  include Mongoid::Document

  <%= model_attributes.map { |a| "field :#{a.name}, :type => #{a.type.capitalize}" }.join("\n") %>    
end
