# encoding: utf-8

$LOAD_PATH.push File.expand_path('../lib', __FILE__)

require 'pristine/version'

Gem::Specification.new do |s|
  s.name        = 'pristine'
  s.version     = Pristine::VERSION
  s.authors     = ['Carla Souza']
  s.email       = ['contact@carlasouza.com']
  s.homepage    = 'https://github.com/carlasouza/pristine'
  s.summary     = 'Pristine configuration files.'
  s.description = 'Watches if any file managed by Puppet was modified.'
  s.license     = 'GPL-3.0'

  s.files = Dir['{lib,bin}/**/*', 'LICENSE', 'README.md']
  s.executables  = Dir['bin/*'].map{ |f| File.basename(f) }
  s.require_path = 'lib'

  s.add_dependency('rb-inotify', '~> 0.9.7')
end

