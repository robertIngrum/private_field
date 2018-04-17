lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'private_field/version'

Gem::Specification.new do |spec|
  spec.name        = 'private_field'
  spec.version     = PrivateField::VERSION
  spec.date        = '2018-04-16'
  spec.summary     = 'Make Rails fields private to avoid those lazy temptations.'
  spec.description = 'I\'m honestly not sure what the difference between '\
                  'a summary and description is but this one\'s longer.'
  spec.authors     = ['Robert Ingrum']
  spec.email       = 'robert@forustheliving.com'
  spec.homepage    = 'http://rubygems.org/gems/private_field'
  spec.license     = 'MIT'

  spec.files       = `git ls-files`.split($/)

  spec.add_development_dependency 'rspec',   '~> 3.0'
  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'mongoid', '~> 3.0'
  spec.add_development_dependency 'pry',     '~> 1.0'
end
