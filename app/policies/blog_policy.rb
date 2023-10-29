class BlogPolicy < ApplicationPolicy
  attr_reader :user, :blog

  def initialize(user, blog)
    @user = user
    @blog = blog
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
