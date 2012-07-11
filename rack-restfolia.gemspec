# -*- encoding: utf-8 -*-
require File.expand_path('../lib/rack/restfolia/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Fred"]
  gem.email         = ["fpaula@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "rack-restfolia"
  gem.require_paths = ["lib"]
  gem.version       = Rack::Restfolia::VERSION
  
  gem.add_dependency 'restfolia'

  gem.add_development_dependency 'rspec' 
  gem.add_development_dependency 'rack-test' 
  gem.add_development_dependency 'webmock' 
end
