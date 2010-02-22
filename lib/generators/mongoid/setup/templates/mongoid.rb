File.open(File.join(Rails.root, 'config/database.mongo.yml'), 'r') do |f|
  @settings = YAML.load(f)[Rails.env]
end
connection = Mongo::Connection.new(@settings["host"])
Mongoid.database = connection.db(@settings["database"])
if @settings["username"]
  Mongoid.database.authenticate(@settings["username"], @settings["password"])
end
