class DashboardController < ApplicationController
  def index
    authentication = current_user
    @messages = policy_scope(Message).all
    @acceptances = Acceptance.where(email: authentication.email)
  end
end
