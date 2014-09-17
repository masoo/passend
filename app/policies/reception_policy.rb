class ReceptionPolicy
  attr_reader :user, :reception

  def initialize(user, reception)
    @user = user
    @reception = reception
  end

  def index?
    user_signed_in?
  end

  ## user authority
  def user_signed_in?
    @user.present?
  end

  ## reception authority
  def reception_present?
    @reception.present?
  end
end

class ReceptionPolicy
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      nil
    end
  end
end
