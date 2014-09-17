class DestinationPolicy
  attr_reader :user, :destination

  def initialize(user, destination)
    @user = user
    @destination = destination
  end

  def destroy?
    destination_owner?
  end

  ## user authority
  def user_signed_in?
    @user.present?
  end

  ## destination authority
  def destination_present?
    @destination.present?
  end

  ## authority
  def destination_owner?
    user_signed_in? and destination_present? and (@destination.message.user.id == @user.id)
  end

end

class DestinationPolicy
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user_signed_in?
        @scope.where(user_id: @user.id)
      else
        nil
      end
    end

    private

    def user_signed_in?
      @user.present?
    end
  end
end