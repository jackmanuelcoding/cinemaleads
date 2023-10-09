require "test_helper"

class LeadPolicyTest < ActiveSupport::TestCase
  setup do
    @admin = users(:admin)
    @customer = users(:customer)
    @lead = leads(:one)

    @admin.confirm
    @customer.confirm
  end

  test "should grant admin access to new" do
    sign_in @admin
    assert LeadPolicy.new(@admin, @lead).new?
  end

  test "should deny customer access to new" do
    sign_in @customer
    assert_not LeadPolicy.new(@customer, @lead).new?
  end

  test "should grant admin access to create" do
    sign_in @admin
    assert LeadPolicy.new(@admin, @lead).create?
  end

  test "should deny customer access to create" do
    sign_in @customer
    assert_not LeadPolicy.new(@customer, @lead).create?
  end

  test "should grant admin access to edit" do
    sign_in @admin
    assert LeadPolicy.new(@admin, @lead).edit?
  end

  test "should deny customer access to edit" do
    sign_in @customer
    assert_not LeadPolicy.new(@customer, @lead).edit?
  end

  test "should grant admin access to update" do
    sign_in @admin
    assert LeadPolicy.new(@admin, @lead).update?
  end

  test "should deny customer access to update" do
    sign_in @customer
    assert_not LeadPolicy.new(@customer, @lead).update?
  end

  test "should grant admin access to destroy" do
    sign_in @admin
    assert LeadPolicy.new(@admin, @lead).destroy?
  end

  test "should deny customer access to destroy" do
    sign_in @customer
    assert_not LeadPolicy.new(@customer, @lead).destroy?
  end
end
