class ItemPolicy < ApplicationPolicy
  def index?
    user
  end

  def new?
    record.store == user
  end

  def create?
    new?
  end

  def edit?
    record.store == user
  end

  def update?
    edit?
  end

  def destroy?
    edit?
  end

  def permitted_attributes
    %i(price available product_id)
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
