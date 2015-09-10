# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'apod/version'

Gem::Specification.new do |spec|
  spec.name          = "apod"
  spec.version       = Apod::VERSION
  spec.authors       = ["Doug Prostko"]
  spec.email         = ["dougtko@gmail.com"]

  spec.summary       = %q{A library to work with NASA's astronomy pictures of the day.}
  spec.description   = %q{A library to work with NASA's astronomy pictures of the day.}
  spec.homepage      = "https://github.com/dougsko/apod"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
