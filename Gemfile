source 'https://rubygems.org'

source 'http://rails-assets.org' do
  gem 'rails-assets-bootstrap-treeview'

  group :development, :test do
    gem 'rails-assets-bootstrap-rtl'
    gem 'rails-assets-jquery-knob'
    gem 'rails-assets-bootstrap-daterangepicker'
    gem 'rails-assets-jquery-sparkline'
    gem 'rails-assets-jquery-icheck'
    gem 'rails-assets-admin-lte'
    gem 'rails-assets-sugar', '1.4.1'
  end
end

# Declare your gem's dependencies in faalis_comments.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

# To use a debugger
# gem 'byebug', group: [:development, :test]

development_file = [File.expand_path(File.dirname(__FILE__)),
                    ".development"].join("/")

group :development, :test do
  if File.exists?(development_file)
    gem 'faalis',         path: '../Faalis'
    gem "site_framework", path: '../site_framework'
  else
    gem 'faalis',          github: 'Yellowen/Faalis'
    gem 'site_framework',  github: 'Yellowen/site_framework'
  end
  gem 'minitest-rails'
  gem 'guard'
  gem 'rb-fsevent'
  gem 'capybara'
  gem 'connection_pool'
  gem 'launchy'
  gem 'minitest-reporters'
  gem 'mocha'
  gem 'poltergeist'
  gem 'fabrication'
  gem 'minitest-rails-capybara'
  gem 'minitest-around'
  gem 'database_cleaner'
  gem 'guard-minitest'
  gem 'pg'
  gem 'annotate'
  gem 'faker'
  gem 'jquery-turbolinks'
  gem 'guard-cane'
#  gem 'faalis-tags', path: '../faalis_tags'
end
