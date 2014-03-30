$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'scroll/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'scroll'
  s.version     = Scroll::VERSION
  s.authors     = ['Jiri Kolarik']
  s.email       = ['jiri.kolarik@imin.cz']
  s.homepage    = 'http://werein.cz'
  s.summary     = 'Simple pages for Project.'
  s.description = 'Simple pages for Project.'

  s.files       = Dir['{app,config,db,lib}/**/*', 'LICENSE.txt', 'Rakefile', 'README.md']
  s.test_files  = Dir['test/*.*' ,'test/{cells,controllers,data,helpers,integration,models}/**/*','test/dummy/*.*', 'test/dummy/{app,bin,config,db,lib}/**/*']

  s.add_dependency 'rails', '~> 4.0'
  s.add_dependency 'foundationstone', '~> 0.0.1'
  s.add_dependency 'uppr', '~> 1.0'
  s.add_dependency 'high_voltage', '~> 2.1.0'
  s.add_dependency 'enumerize'
  s.add_dependency 'globalize', '~> 4.0.0'
  s.add_dependency 'globalize-missing', '~> 1.0.0'
  s.add_dependency 'friendly_id'
  s.add_dependency 'cells'
  s.add_dependency 'ckeditor'
  s.add_dependency 'simple_form'
  s.add_dependency 'cocoon'

  s.add_development_dependency 'tuberack'
end