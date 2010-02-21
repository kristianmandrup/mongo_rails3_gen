class <%= file_name.camelize %>
  include Mongoid::Document
  
  <% attributes.each do |field, type| %>
    field <%= ":#{field}, :type => #{type.capitalize}" %>
  <% end %>      
  
end
