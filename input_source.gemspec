# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'input_source/version'

Gem::Specification.new do |gem|
  gem.name          = "input_source"
  gem.version       = InputSource::VERSION
  gem.authors       = ["Valery Kvon"]
  gem.email         = ["addagger@gmail.com"]
  gem.description   = %q{Model's attrubutes remembers the field name}
  gem.summary       = %q{Attribute knows the field name. Helpful to improvise with errors handling}
  gem.homepage      = %q{http://vkvon.ru/projects/input_source}

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.licenses      = ['MIT']
end
