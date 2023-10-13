require "test_helper"

class CheckoutsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @unsubscribed = users(:unsubscribed)
    @customer = users(:customer)

    @unsubscribed.confirm
    @customer.confirm
  end

  test "should get new when unsubscribed signed in" do
    sign_in @unsubscribed

    get checkout_url
    assert_response :success
  end

  test "should redirect to leads when user subscribed" do
    sign_in @customer

    get checkout_url
    assert_redirected_to leads_path
  end

  test "should redirect to login when user signed out" do
    get checkout_url
    assert_redirected_to new_user_session_path
  end
end
