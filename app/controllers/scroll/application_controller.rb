module Scroll
  class ApplicationController < ::ApplicationController
    
    # User ability
    def current_ability
      @current_ability ||= Scroll::Ability.new current_user
    end
  end
end