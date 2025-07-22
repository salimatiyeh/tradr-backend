class ListingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all # or scope.where(user_id: user.id) if you want to limit it
    end
  end

  def update?
    user_owns_listing?
  end

  def destroy?
    user_owns_listing?
  end

  def create?
    user.present?
  end

  def show?
    true
  end

  def index?
    true
  end

  private

  def user_owns_listing?
    user.present? && record.user_id == user.id
  end

end
