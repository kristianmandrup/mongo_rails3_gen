#!/user/local/bin/ruby

begin
  require 'rails/ruby_version_check'
rescue LoadError
  # If people are not using gems, the load path must still
  # be correct.
  # TODO: Remove the begin / rescue block somehow
  $:.unshift File.expand_path('../../lib', __FILE__)
  $:.unshift File.expand_path('../../../activesupport/lib', __FILE__)
  $:.unshift File.expand_path('../../../actionpack/lib', __FILE__)
end

Signal.trap("INT") { puts; exit }

ARGV << "--help" if ARGV.empty?

require 'rails/generators'
require 'generators/mongoid/model/model_generator'

Mongoid::Generators::ModelGenerator.start