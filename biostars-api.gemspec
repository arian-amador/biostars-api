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
  spec.homepage      = "https://www.github.com/arian-amador/biostars-api"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  
  spec.add_development_dependency 'minitest', '~> 5.5', '>= 5.5.1'
  spec.add_development_dependency 'minitest-reporters', '~> 1.0', '>= 1.0.11'
  spec.add_development_dependency "shoulda-context", '~> 1.2', '>= 1.2.1'
  spec.add_development_dependency "guard", '~> 2.12', '>= 2.12.4'
  spec.add_development_dependency "guard-minitest", '~> 2.4', '>= 2.4.4'
  spec.add_development_dependency "vcr", '~> 2.9', '>= 2.9.3'
  spec.add_development_dependency "webmock", '~> 1.20', '>= 1.20.4'

  spec.add_dependency "httparty", "~> 0.13.3"
  spec.add_dependency "json", '~> 1.8', '>= 1.8.2'
end
