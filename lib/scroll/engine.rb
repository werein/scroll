require 'foundationstone'
require 'uppr'
require 'enumerize'
require 'globalize'
require 'friendly_id'
require 'cells'
require 'high_voltage'
require 'ckeditor'
require 'cocoon'
require 'cancancan'

module Scroll
  mattr_accessor :user_class

  class Engine < ::Rails::Engine
    isolate_namespace Scroll

    initializer :append_migrations do |app|
      unless app.root.to_s.match root.to_s
        config.paths['db/migrate'].expanded.each do |expanded_path|
          app.config.paths['db/migrate'] << expanded_path
        end
      end
    end
  end
end
