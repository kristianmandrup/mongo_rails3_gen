# encoding: utf-8 

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "mongo_db_gen"
    gem.summary = %Q{Rails 3 generators for Mongo DB}
    gem.description = %Q{Rails 3 Mongo DB generators for MongoMapper and Mongoid}
    gem.email = "kmandrup@gmail.com"
    gem.homepage = "http://github.com/kristianmandrup/mongo_modl"
    gem.authors = ["Kristian Mandrup"]
    gem.add_development_dependency "rspec", ">= 1.2.9"
    gem.add_development_dependency "thor-ext"
    gem.files=FileList['lib/**/*', 'bin/*']  

    gem.default_executable = %q{mongomap_model}
    gem.executables = ["mongoid_setup", "mongoid_model", "mongomapper_setup", "mongomapper_model"]
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }

