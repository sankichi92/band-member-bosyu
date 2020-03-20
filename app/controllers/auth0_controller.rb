class Auth0Controller < ApplicationController
  def login
  end

  def callback
    auth = request.env['omniauth.auth']

    user = User.find_or_initialize_by(auth0_id: auth.uid)
    user.fetch_auth0_user_and_save!

    session[:user_id] = user.id

    redirect_to root_path, notice: 'ログインしました'
  end

  def failure
    redirect_to root_path, alert: params[:message]
  end
end
