class <%= class_name %>
  include MongoMapper::Document

  <%= model_attributes.map { |a| "key :#{a.name}, #{a.type.capitalize}" }.join("\n") %>
end