class ApplicationController < ActionController::Base
  helper_method :current_user

  private

  def current_user
    @current_user ||= if session[:user_id]
                        User.find_by(id: session[:user_id])
                      else
                        nil
                      end
  end

  def require_current_user
    redirect_to login_path, alert: 'ログインしてください' if current_user.nil?
  end
end
