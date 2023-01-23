# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dadaist/version'

Gem::Specification.new do |spec|
  spec.name          = "dadaist"
  spec.version       = Dadaist::VERSION
  spec.authors       = ["Paul Robinson"]
  spec.email         = ["paul@32moves.com"]

  spec.summary       = %q{A tool for randomly generating stories}
  spec.homepage      = "http://github.com/p7r/Dadaist"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_runtime_dependency 'activesupport'
  spec.add_runtime_dependency 'verbs'
  spec.add_runtime_dependency 'twitter'
end
