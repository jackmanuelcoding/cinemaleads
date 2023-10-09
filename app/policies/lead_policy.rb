class LeadPolicy < ApplicationPolicy
  attr_reader :user, :lead

  def initialize(user, lead)
    @user = user
    @lead = lead
  end

  def new?
    user.admin?
  end

  def create?
    user.admin?
  end

  def edit?
    user.admin?
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end
end
