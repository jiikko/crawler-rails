$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "crawler/rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "crawler-rails"
  s.version     = Crawler::Rails::VERSION
  s.authors     = ["jiikko"]
  s.email       = ["n905i.1214@gmail.com"]
  s.homepage    = "https://github.com/jiikko/crawler-rails"
  s.summary     = "rails engine of crawler"
  s.description = s.summary
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", ">= 4.2"
  s.add_dependency "slim-rails"
  s.add_dependency "nested_form"

  s.add_development_dependency "mysql2"

  s.add_development_dependency "rspec"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "spring"
  s.add_development_dependency "pry"
  s.add_development_dependency "factory_girl"
end
