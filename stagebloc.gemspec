# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'stagebloc/version'

Gem::Specification.new do |spec|
  spec.name          = "stagebloc"
  spec.version       = StageBloc::VERSION
  spec.authors       = ["Baylor Rae'"]
  spec.email         = ["opensource@thecodedeli.com"]
  spec.summary       = %q{Ruby API wrapper for StageBloc}
  spec.description   = %q{The StageBloc gem is an API wrapper to give push/receive data for an authenticated user.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
