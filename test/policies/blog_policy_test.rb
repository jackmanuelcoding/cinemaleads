require "test_helper"

class BlogPolicyTest < ActiveSupport::TestCase
  setup do
    @admin = users(:admin)
    @customer = users(:customer)
    @blog = blogs(:one)

    @admin.confirm
    @customer.confirm
  end

  test "should grant admin access to new" do
    sign_in @admin
    assert BlogPolicy.new(@admin, @blog).new?
  end

  test "should deny customer access to new" do
    sign_in @customer
    assert_not BlogPolicy.new(@customer, @blog).new?
  end

  test "should grant admin access to create" do
    sign_in @admin
    assert BlogPolicy.new(@admin, @blog).create?
  end

  test "should deny customer access to create" do
    sign_in @customer
    assert_not BlogPolicy.new(@customer, @blog).create?
  end

  test "should grant admin access to edit" do
    sign_in @admin
    assert BlogPolicy.new(@admin, @blog).edit?
  end

  test "should deny customer access to edit" do
    sign_in @customer
    assert_not BlogPolicy.new(@customer, @blog).edit?
  end

  test "should grant admin access to update" do
    sign_in @admin
    assert BlogPolicy.new(@admin, @blog).update?
  end

  test "should deny customer access to update" do
    sign_in @customer
    assert_not BlogPolicy.new(@customer, @blog).update?
  end

  test "should grant admin access to destroy" do
    sign_in @admin
    assert BlogPolicy.new(@admin, @blog).destroy?
  end

  test "should deny customer access to destroy" do
    sign_in @customer
    assert_not BlogPolicy.new(@customer, @blog).destroy?
  end
end
