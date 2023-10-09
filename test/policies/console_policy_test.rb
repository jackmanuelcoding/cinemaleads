require "test_helper"

class ConsolePolicyTest < ActiveSupport::TestCase
  setup do
    @admin = users(:admin)
    @customer = users(:customer)
    @console = :console

    @admin.confirm
    @customer.confirm
  end

  test "should permit admin access to console" do
    sign_in @admin
    assert ConsolePolicy.new(@admin, @console).show?
  end

  test "should deny customer access to console" do
    sign_in @customer
    assert_not ConsolePolicy.new(@customer, @console).show?
  end
end
