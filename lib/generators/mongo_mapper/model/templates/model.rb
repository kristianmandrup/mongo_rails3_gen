class <%= file_name %>
  include MongoMapper::Document

  <% attributes.each do |field, type| %>
    key <%= ":#{field}, #{type.capitalize}" %>
  <% end %>      
end