$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "crawler/rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "crawler-rails"
  s.version     = Crawler::Rails::VERSION
  s.authors     = ["jiikko"]
  s.email       = ["n905i.1214@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Crawler::Rails."
  s.description = "TODO: Description of Crawler::Rails."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.0"

  s.add_development_dependency "mysql2"
end
