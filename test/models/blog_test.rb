require "test_helper"

class BlogTest < ActiveSupport::TestCase
  setup do
    @admin = users(:admin)
    @blog = blogs(:one)
    @blog_two = blogs(:two)
    @blog_three = blogs(:three)
    @blog_four = blogs(:four)

    @admin.confirm
    sign_in @admin
  end

  test "should be valid when all fields are present" do
    assert @blog.valid?
  end

  test "should be invalid when no fields are present" do
    assert @blog_two.invalid?
  end

  test "should be invalid when title exceeds 255 characters" do
    assert @blog_three.invalid?
  end

  test "should be invalid when body exceeds 30,000 characters" do
    assert @blog_four.invalid?
  end
end
