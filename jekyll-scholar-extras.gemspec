# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'jekyll/scholar/version'

Gem::Specification.new do |s|
  s.name        = 'jekyll-scholar-extras'
  s.version     = Jekyll::ScholarExtras::VERSION.dup
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Hiren D. Patel']
  s.email       = 'hdpatel at uwaterloo dot ca'
  s.homepage    = 'http://github.com/hdpatel/jekyll-scholar-extras'
  s.summary     = 'Extras for Jekyll extensions for the academic blogger jekyll-scholar.'
  s.description = %q{
    Extras for jekyll-scholar.  Customized bibliography and details generators.
  }.gsub(/\s+/, ' ')
  
  s.date        = Time.now

  s.required_rubygems_version = '>= 1.3.6'
  s.rubyforge_project = s.name

  s.add_runtime_dependency('jekyll', '~> 0.11.2')
  s.add_runtime_dependency('jekyll-scholar', '~> 0.0.7')
  s.add_runtime_dependency('citeproc-ruby', '~> 0.0.6')
  s.add_runtime_dependency('bibtex-ruby', '~> 2.0.5')

  s.add_development_dependency('rake', "~> 0.9")
  s.add_development_dependency('rdoc', "~> 3.11")
  s.add_development_dependency('redgreen', "~> 1.2")
  s.add_development_dependency('shoulda', "~> 2.11")
  s.add_development_dependency('rr', "~> 1.0")
  s.add_development_dependency('cucumber', "1.1")
  s.add_development_dependency('RedCloth', "~> 4.2")
  s.add_development_dependency('rdiscount', "~> 1.6")
  s.add_development_dependency('redcarpet', "~> 1.9")  

  s.files        = `git ls-files`.split("\n")
  s.test_files   = `git ls-files -- {samples,test,spec,features}/*`.split("\n")
  s.executables  = []
  s.require_path = 'lib'
  
end

# vim: syntax=ruby
