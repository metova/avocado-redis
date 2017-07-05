# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'avocado/redis/version'

Gem::Specification.new do |spec|
  spec.name        = 'avocado-redis'
  spec.version     = Avocado::Redis::VERSION
  spec.authors     = ['Logan Serman']
  spec.email       = ['logan.serman@metova.com']
  spec.summary     = 'Redis storage adapter for Avocado.'
  spec.description = spec.summary
  spec.homepage    = 'https://github.com/metova/avocado'
  spec.license     = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'avocado-docs', '>= 4.0.0'
  spec.add_dependency 'redis', '>= 3.2.0'
  spec.add_dependency 'activesupport', '>= 5.0.0'

  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'fakeredis', '>= 0.5.0'
end
