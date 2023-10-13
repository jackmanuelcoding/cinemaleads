require "test_helper"

class LeadsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = users(:admin)
    @unsubscribed = users(:unsubscribed)
    @customer = users(:customer)
    @lead = leads(:one)

    @admin.confirm
    @unsubscribed.confirm
    @customer.confirm
  end

  test "should get index" do
    sign_in @admin

    get leads_url
    assert_response :success
  end

  test "should get new" do
    sign_in @admin

    get new_lead_url
    assert_response :success
  end

  test "should get edit" do
    sign_in @admin

    get edit_lead_url(@lead)
    assert_response :success
  end

  test "should redirect from leads to checkout when user unsubscribed" do
    sign_in @unsubscribed

    get leads_url
    assert_redirected_to checkout_url
  end
end
