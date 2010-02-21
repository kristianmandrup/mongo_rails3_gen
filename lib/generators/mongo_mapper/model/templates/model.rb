class <%= class_name %>   
  <% if options[:embedded] %>
  include MongoMapper::EmbeddedDocument  
  <% else %>                   
  include MongoMapper::Document  
  <% end %>
  
  <%= model_attributes.map { |a| "key :#{a.name}, #{a.type.capitalize}" }.join("\n") %>
end