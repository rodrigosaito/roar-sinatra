# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'roar-sinatra/version'

Gem::Specification.new do |gem|
  gem.name          = "roar-sinatra"
  gem.version       = Roar::Sinatra::VERSION
  gem.authors       = ["Rodrigo Saito"]
  gem.email         = ["rodrigo.saito@gmail.com"]
  gem.description   = %q{Integration of roar into Sinatra}
  gem.summary       = %q{Integration of roar into Sinatra}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'sinatra'
  gem.add_dependency 'sinatra-contrib'
  gem.add_dependency 'roar'
end
