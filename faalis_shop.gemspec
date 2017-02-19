$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require 'faalis/shop/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|

  s.licenses = ['GPL-2']
  s.name        = 'faalis-shop'
  s.version     = Faalis::Shop::VERSION
  s.authors     = ['Sameer Rahmani', 'Behnam Ahmad khan Beigi']
  s.email       = ['lxsameer@gnu.org', 'yottanami@gnu.org']
  s.homepage    = "http://github.com/Yellowen/faalis_shop"
  s.summary     = 'Shop engine for Faalis platform'
  s.description = 'Shop engine for Faalis platform.'

  s.files = Dir["{app,config,db,lib}/**/*", 'LICENSE', "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_development_dependency 'sqlite3'
  s.add_dependency 'faalis', '> 2'
  s.add_dependency 'kramdown'
  s.add_dependency 'site_framework'
  s.add_dependency 'paperclip', "~> 5.0.0"
  #  s.add_dependency 'faalis-tags'
end
