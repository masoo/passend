class Messages::AcceptancesController < ApplicationController
  def index
    authorize Acceptance.new
    authentication = current_user
    @acceptances = Acceptance.where(email: authentication.email)
  end
end
