$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "scroll/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "scroll"
  s.version     = Scroll::VERSION
  s.authors     = ["Jiri Kolarik"]
  s.email       = ["jiri.kolarik@imin.cz"]
  s.homepage    = "http://werein.cz"
  s.summary     = "Simple pages for Project."
  s.description = "Simple pages for Project."

  s.files       = Dir["{app,config,db,lib}/**/*", "LICENSE.txt", "Rakefile", "README.rdoc"]
  s.test_files  = Dir["test/*.*" ,"test/{cells,controllers,data,helpers,integration,models}/**/*","test/dummy/*.*", "test/dummy/{app,bin,config,db,lib}/**/*"]

  s.add_dependency "rails", "~> 4.0"

  s.add_development_dependency "testable"
  s.add_development_dependency "i18n-tasks", '~> 0.2'
end