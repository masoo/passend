class DestinationsController < ApplicationController
  def destroy
    destinations = DestinationPolicy::Scope.new(current_user, Destination).resolve
    destination = destinations.where(id: params[:id]).last
    @policy = DestinationPolicy.new(current_user, destination)
    return render :file => "public/401.html", :layout => false, :status => :unauthorized unless @policy.destroy?

    @destination = destination
    begin
      Destination.transaction {
        @destination.destroy!
      }
      redirect_to messages_url, notice: 'destination was successfully destroyed.'
    rescue => error
        flash[:alert] = error.message
        redirect_to messages_url
    end
  end
end
