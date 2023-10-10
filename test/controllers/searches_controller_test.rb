require "test_helper"

class SearchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customer = users(:customer)

    @customer.confirm
    sign_in @customer
  end

  test "should get index" do
    get search_url
    assert_response :success
  end
end
