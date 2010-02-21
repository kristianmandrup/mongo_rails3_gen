class <%= file_name.camelize %>
  include Mongoid::Document

  <% model_attributes.map { |a| "field :#{a.name}, :type => #{a.type.capitalize}" }.join("\n") %>    
end
