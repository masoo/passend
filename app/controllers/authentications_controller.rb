class AuthenticationsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @authentication = Authentication.new
    authorize @authentication
    render layout: false
  end

  def create
    ApplicationRecord.transaction do
      @authentication = Authentication.find_or_create_by(authentication_params)
      authorize @authentication
      @authentication.create_user if @authentication.user.blank?
    end
    @authentication.deliver_magic_login_instructions!
    render layout: false
  end

  private
    def authentication_params
      params.require(:authentication).permit(:email)
    end
end
