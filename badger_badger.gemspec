# encoding: utf-8
require File.join(File.dirname(__FILE__), 'lib', 'badger_badger', 'version')

Gem::Specification.new do |spec|
  spec.name = 'badger_badger'
  spec.version = BadgerBadger::VERSION
  spec.summary = "A DSL for defining badges and awarding badges"
  spec.description = "A DSL for defining badges and awarding badges. Uses hooks instead of being tied to any specific framework or ORM."
  spec.authors = ['Jordan Hollinger']
  spec.date = '2013-10-13'
  spec.email = 'jordan@jordanhollinger.com'
  spec.homepage = 'http://github.com/jhollinger/badger_badger'

  spec.require_paths = ['lib']
  spec.files = [Dir.glob('lib/**/*'), 'README.rdoc', 'LICENSE'].flatten
end
