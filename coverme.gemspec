# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'coverme/version'

Gem::Specification.new do |spec|
  spec.name          = "coverme"
  spec.version       = Coverme::VERSION
  spec.authors       = ["Martin Schneider"]
  spec.email         = ["info@outsmartin.de"]
  spec.summary       = %q{Client to send data to coverme.io}
  spec.description   = %q{This is a gem to easily set up coverage reporting for coverme.io. Currently
  it supports only SimpleCov JSON reports.}
  spec.homepage      = "http://coverme.io"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(spec|features)/})
  spec.require_paths = ["lib"]
end
