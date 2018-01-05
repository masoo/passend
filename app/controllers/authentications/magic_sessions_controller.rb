class Authentications::MagicSessionsController < ApplicationController
  skip_before_action :require_login, only: [:new]

  def new
    token = params[:token]
    @authentication = Authentication.load_from_magic_login_token(token)

    if @authentication.blank?
      not_authenticated
      return
    else
      auto_login(@authentication)
      @authentication.clear_magic_login_token!
      redirect_to root_path, notice: 'Logged in successfully'
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: 'Log out!'
  end
end
