# coding: utf-8
$:.unshift File.expand_path('../lib', __FILE__)
require 'biostars/api'

Gem::Specification.new do |spec|
  spec.name          = "biostars-api"
  spec.version       = Biostars::API::VERSION
  spec.authors       = ["Arian Amador"]
  spec.email         = ["arian@arianamador.com"]

  if spec.respond_to?(:metadata)
    # spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end

  spec.summary       = %q{Gem wrapping biostars.org public API}
  spec.description   = %q{Gem wrapping biostars.org public API}
  spec.homepage      = "https://www.github.com/arianamador/biostars-api"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "minitest-reporters"
  spec.add_development_dependency "shoulda-context"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-minitest"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"

  spec.add_dependency "httparty"
  spec.add_dependency "json"
end