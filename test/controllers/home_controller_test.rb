require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = users(:admin)
    @customer = users(:customer)

    @admin.confirm
    @customer.confirm
  end

  test "should get home when a guest visits" do
    get root_url
    assert_response :success
  end

  test "should redirect to leads when an admin is signed in" do
    sign_in @admin

    get root_url
    assert_redirected_to leads_url
  end

  test "should redirect to leads when a customer is signed in" do
    sign_in @customer

    get root_url
    assert_redirected_to leads_url
  end
end
