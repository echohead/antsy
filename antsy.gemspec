# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
require 'antsy/version'

Gem::Specification.new do |s|
  s.name        = 'antsy'
  s.version     = Antsy::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = [ 'Tim Miller' ]
  s.email       = [ '' ]
  s.homepage    = 'https://github.com/echohead/ansible-module'
  s.summary     = %q{utility functions for ansible modules}
  s.description = %q{utility functions for ansible modules}

  s.required_ruby_version     = ">= 1.8.7"
  s.required_rubygems_version = ">= 1"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {spec}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_runtime_dependency     'json', '>= 0'
end
