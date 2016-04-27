class GistPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(public: true)
    end
  end

  def new?
    create?
  end

  def create?
    true
  end

  def show?
    record.public == true || record.user == user
  end

  def update?
    destroy?
  end

  def destroy?
    record.user == user
  end
end
