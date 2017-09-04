# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "hefted/version"

Gem::Specification.new do |spec|
  spec.name          = "hefted"
  spec.version       = Hefted::VERSION
  spec.authors       = ["weathare"]
  spec.email         = ["fuzuki.close@gmail.com"]

  spec.summary       = "Minimal Struct making constants."
  spec.homepage      = "https://github.com/weathare/hefted"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.4.0"

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
