module Scroll
  class ApplicationController < Core::ApplicationController
    
    # User ability
    def current_ability
      @current_ability ||= Scroll::Ability.new current_user
    end
  end
end