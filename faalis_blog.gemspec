$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require 'faalis/blog/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|

  s.licenses = ['GPL-2']
  s.name        = 'faalis-blog'
  s.version     = Faalis::Blog::VERSION
  s.authors     = ['Sameer Rahmani']
  s.email       = ['lxsameer@gnu.org']
  s.homepage    = "http://github.com/Yellowen/faalis_blog"
  s.summary     = 'Blog engine for Faalis platform'
  s.description = 'Blog engine for Faalis platform.'

  s.files = Dir["{app,config,db,lib}/**/*", 'LICENSE', "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_development_dependency 'sqlite3'
  s.add_dependency 'faalis', '> 2'
  s.add_dependency 'redcarpet'
  s.add_dependency 'site_framework'
  s.add_dependency 'faalis-tags'

end
