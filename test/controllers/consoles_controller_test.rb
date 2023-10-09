require "test_helper"

class ConsolesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = users(:admin)
    @customer = users(:customer)
    @lead = leads(:one)

    @admin.confirm
    @customer.confirm
  end

  test "should get show" do
    sign_in @admin

    get console_url
    assert_response :success
  end

  test "should redirect to leads" do
    sign_in @customer

    get console_url
    assert_redirected_to leads_path
  end

  test "should redirect to login" do
    get console_url
    assert_redirected_to new_user_session_path
  end
end
