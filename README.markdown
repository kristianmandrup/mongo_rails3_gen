# Mongo DB generators ##

The Mongo DB Rails 3 generators includes generators for both Mongo Mapper and Mongoid.

These generators have recently been integrated into my forks of mongomapper and mongoid. 
Please let me know if they work there as well and if you have ideas for further improvements. 

I also have a rails_model_maker in the works, to let a rails model graph be defined in yaml and all the rails model files generated for
the model framework of choice (ActiveRecord, Datamapper, MongoMapper, Mongoid etc.). Feel free to assist in the effort to finish the rails_model_maker project
and add "plugins" for whichever model framework you like. 

# Installation ##

Add the following to your Gemfile in your Rails 3 project:

Note: Always check if there is a more recent or better fork to use...

<pre>
gem 'mongo_ext'
gem 'mongoid', :git => 'http://github.com/kristianmandrup/mongoid.git'
gem "mongo_mapper", :git => 'http://github.com/kristianmandrup/mongomapper.git'

$ bundle install
</pre>
  
## Mongoid ##

Includes the following generators
  
* mongoid:setup       - setup Rails app to use Mongoid
* mongoid:model       - generates a Mongoid model

Example Use:

Setup use of Mongoid

  rails g mongoid:setup

Create new model Person with name attribute

<pre>
  rails g mongoid:model person name:string

=>
  class Person 
    field :name, :type => String    
  end
</pre>

Create document Address with attributes defaulting to string  

<pre>
  rails g mongoid:model Address name street                           

=>
  class Address 
    include Mongoid::Timestamps    
    field :name, :type => String    
    field :street, :type => String    
  end
</pre>

Add Timestamps using -T (true by default)
<pre>

  rails g mongoid:model person name:string -T

=>
  class Person < Being
    include Mongoid::Timestamps    
    field :name, :type => String
  end
</pre>

Add Versioning using -V (false by default)

<pre>
  rails g mongoid:model person name:string -V

=>
  class Person < Being
    include Mongoid::Versioning    
    field :name, :type => String
  end
</pre>

Index select attributes by postfixing name with #

<pre>
  rails g mongoid:model person name:string# -V

=>
  class Person < Being
    field :person, :type => String
    index :name, :unique => true      
  end
</pre>

Create Embedded document Browser as a kind of Being (Inheritance) 

<pre>
  rails g mongoid:model person name:string --inherit canvas                           

=>
  class Person < Being
    field :person, :type => String
  end
</pre>
  
## Mongo Mapper ##

Includes the following generators

* mongo_mapper:setup  - setup Rails app to use Mongo Mapper
* mongo_mapper:model  - generates a Mongo Mapper model

Example Use:

Setup use of Mongo Mapper

  `rails g mongoid:setup`

Create new Mongo Mapper model Person with name attribute

  `rails g mongoid:model person name:string`

Create Embedded document Address with attributes defaulting to string

  `rails g mongoid:model address name street --embedded`

## Notice ##

This is currently a work in progress. Please feel free to join in the effort and fork this project and help fix and improve.

