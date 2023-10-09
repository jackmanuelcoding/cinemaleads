class ConsolePolicy < ApplicationPolicy
  attr_reader :user

  def initialize(user, _console)
    @user = user
  end

  def show?
    user.admin?
  end
end
