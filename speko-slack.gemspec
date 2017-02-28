# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'speko/slack/version'

Gem::Specification.new do |spec|
  spec.name          = "speko-slack"
  spec.version       = Speko::Slack::VERSION
  spec.authors       = ["Kotowick"]
  spec.email         = ["info@speko.io"]

  spec.summary       = %q{Speko Slack: custom gem for Slack notifications.}
  spec.description   = %q{Speko Slack: custom gem for Slack notifications.}
  spec.homepage      = "https://github.com/kotowick/speko-slack"
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # A Ruby and command-line client for the Slack Web and Real Time Messaging APIs
  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_dependency "slack-ruby-client"
  spec.add_dependency 'acts-as-taggable-on', '~> 4.0'
end
