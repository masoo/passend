class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_action :require_login

  private
    def not_authenticated
      redirect_to new_authentication_path, notice: "Please login first"
    end
end
