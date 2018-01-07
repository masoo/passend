class Messages::AcceptancesController < ApplicationController
  def index
    authentication = current_user
    @acceptances = Acceptance.where(email: authentication.email)
  end
end
