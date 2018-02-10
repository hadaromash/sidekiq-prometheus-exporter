# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sidekiq/prometheus/exporter/version'

Gem::Specification.new do |spec|
  spec.name          = 'sidekiq-prometheus-exporter'
  spec.version       = Sidekiq::Prometheus::Exporter::VERSION
  spec.authors       = ['Sergey Fedorov']
  spec.email         = %w[oni.strech@gmail.com]

  spec.summary       = 'Prometheus exporter for the Sidekiq'
  spec.description   = 'All the basic metrics prepared for Prometheus'
  spec.homepage      = 'https://github.com/Strech/sidekiq-prometheus-exporter'

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |file|
    file.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |file| File.basename(file) }
  spec.require_paths = %w[lib]

  spec.add_dependency 'sidekiq', '>= 2.12.3'

  spec.add_development_dependency 'bundler',    '~> 1.16'
  spec.add_development_dependency 'pry-byebug', '~> 3.6'
  spec.add_development_dependency 'rack-test',  '~> 0.8'
  spec.add_development_dependency 'rake',       '~> 10.0'
  spec.add_development_dependency 'rspec',      '~> 3.0'
  spec.add_development_dependency 'rubocop',    '~> 0.52'
end
