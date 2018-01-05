class AuthenticationsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @authentication = Authentication.new
    render layout: false
  end

  def create
    @authentication = Authentication.find_or_create_by(authentication_params)
    @authentication.deliver_magic_login_instructions!
    render layout: false
  end

  private
    def authentication_params
      params.require(:authentication).permit(:email)
    end
end
