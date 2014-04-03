require "scroll/engine"

module Scroll
  def self.user_class
    @@user_class.constantize
  end
end
