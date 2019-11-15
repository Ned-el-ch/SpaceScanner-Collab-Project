class ApplicationController < ActionController::Base
    helper_method :current_user
    def current_user
      if session[:user_id]
        @current_user ||= User.find(session[:user_id])
      else
        @current_user = nil
      end
      
    end

    def all_planets

        Planet.all.sort_by{|p| p.name}
        
    end

    def easteregg

      render "easteregg/index"
      
    end
    
  end