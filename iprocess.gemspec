$LOAD_PATH.unshift './lib'
require 'iprocess/version'

Gem::Specification.new do |s|
  s.name         = 'iprocess'
  s.version      = IProcess::VERSION
  s.authors      = ["Rob Gleeson"]
  s.email        = 'rob@flowof.info'
  s.homepage     = 'https://github.com/robgleeson/iprocess'
  s.summary      = 'A set of classes you can use to transport ruby objects ' \
                   'between processes on UNIX-like operating systems.'  
  s.description  = s.summary

  s.files        = `git ls-files`.each_line.map(&:chomp)
  s.test_files   = Dir.glob "test/**/*.rb"

  s.platform                  = Gem::Platform::RUBY
  s.require_path              = 'lib'
  s.rubyforge_project         = '[none]'
  s.required_rubygems_version = '>= 1.3.6'
  s.required_ruby_version     = '~> 1.9.1'

  s.add_development_dependency 'yard'     , '~> 0.7'
  s.add_development_dependency 'redcarpet', '~> 1.17' 
  s.add_development_dependency 'minitest' , '~> 2.6'
  s.add_development_dependency 'rake'     , '~> 0.9.2'
end
