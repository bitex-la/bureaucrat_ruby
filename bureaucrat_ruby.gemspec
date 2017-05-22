# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bureaucrat_ruby/version'

Gem::Specification.new do |spec|
  spec.name          = "bureaucrat_ruby"
  spec.version       = BureaucratRuby::VERSION
  spec.authors       = ["nubis"]
  spec.email         = ["yo@nubis.im"]

  spec.summary       = %q{Ruby Bindings for the Bureaucrat validator library.
  See https://github.com/bitex-la/bureaucrat
  }
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_dependency "json_api_client", "~> 1.5"
  spec.add_dependency "json_ffi_client", "~> 0.1"

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "byebug", "~> 9.0"
end
