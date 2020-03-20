class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    @current_user ||= if session[:user_id]
                        User.find_by(id: session[:user_id])
                      else
                        nil
                      end
  end
end
