# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'secrets/version'

Gem::Specification.new do |spec|
  spec.name          = "secrets"
  spec.version       = Secrets::VERSION
  spec.authors       = ["Matteo Abis"]
  spec.email         = ["gmatteo..abis@gmail.com"]
  spec.summary       = "read and write from a secret yml file"
  spec.description   = "read and write from a secret yml file"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rake"
end
