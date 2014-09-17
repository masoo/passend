class MessagePolicy
  attr_reader :user, :message

  def initialize(user, message)
    @user = user
    @message = message
  end

  def index?
    user_signed_in?
  end

  def show?
    message_owner?
  end

  def new?
    user_signed_in?
  end

  def edit?
    message_owner?
  end

  def create?
    user_signed_in?
  end

  def update?
    message_owner?
  end

  def destroy?
    message_owner?
  end

  ## user authority
  def user_signed_in?
    @user.present?
  end

  ## message authority
  def message_present?
    @message.present?
  end

  ## authority
  def message_owner?
    user_signed_in? and message_present? and (@message.user.id == @user.id)
  end

end

class MessagePolicy
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user_signed_in?
        @user.messages.all
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
