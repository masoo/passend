class ReceptionsController < ApplicationController

  def index
    @policy = ReceptionPolicy.new(current_user, nil)
    return render :file => "public/401.html", :layout => false, :status => :unauthorized unless @policy.index?

    messages = []
    destinations = Destination.where(email: current_user.email)
    destinations.each do |destination|
      messages.unshift(destination.message)
    end
    @messages = messages
  end
end
