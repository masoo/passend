class MessagePolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    record.user_id == user.user.id or record.acceptances.exists?(email: user.email)
  end

  def create?
    record.user_id == user.user.id
  end

  def new?
    true
  end

  def update?
    record.user_id == user.user.id
  end

  def edit?
    record.user_id == user.user.id
  end

  def destroy?
    record.user_id == user.user.id
  end

  def own?
    record.user_id == user.user.id
  end

  class Scope < Scope
    def resolve
      scope.where(user_id: user.user.id)
    end
  end
end
