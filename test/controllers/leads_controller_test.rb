require "test_helper"

class LeadsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = users(:admin)
    @unsubscribed = users(:unsubscribed)
    @customer = users(:customer)
    @lead = leads(:one)
    @lead_three = leads(:three)

    @admin.confirm
    @unsubscribed.confirm
    @customer.confirm
  end

  test "should get index" do
    sign_in @admin

    get leads_url(@lead, @lead_three)
    assert_response :success
  end

  test "should get new" do
    sign_in @admin

    get new_lead_url
    assert_response :success
  end

  test "should create lead" do
    sign_in @admin

    assert_difference("Lead.count", 1) do
      post leads_url,
           params: {
             lead: {
               country: "MyString",
               company: "MyString",
               website: "MyString",
               linkedin: "MyString",
               category: "distributors"
             }
           }
    end
    assert_redirected_to console_url
    assert_equal "MyString has been added to leads.", flash[:notice]
  end

  test "should get edit" do
    sign_in @admin

    get edit_lead_url(@lead)
    assert_response :success
  end

  test "should update lead" do
    sign_in @admin

    assert_difference("Lead.count", 0) do
      put lead_url(@lead),
          params: {
            lead: {
              country: "United States",
              company: "MyString",
              website: "MyString",
              linkedin: "MyString",
              category: "distributors"
            }
          }
    end
    assert_redirected_to console_url
    assert_equal "MyString has been updated.", flash[:notice]
  end

  test "should destroy lead" do
    sign_in @admin

    assert_difference("Lead.count", -1) do
      delete lead_url(@lead)
      assert_redirected_to console_url
      assert_equal "MyString has been removed from leads.", flash[:notice]
    end
  end

  test "should redirect from leads to checkout when user unsubscribed" do
    sign_in @unsubscribed

    get leads_url
    assert_redirected_to checkout_url
  end
end
