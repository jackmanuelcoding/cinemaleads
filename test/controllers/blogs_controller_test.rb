require "test_helper"

class BlogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = users(:admin)
    @blog = blogs(:one)
    @blogs = blogs(:one, :five)

    @admin.confirm
  end

  test "should get index" do
    get blogs_url(@blogs)
    assert_response :success
  end

  test "should get show" do
    get blog_url(@blog)
    assert_response :success
  end

  test "should get new" do
    sign_in @admin

    get new_blog_url
    assert_response :success
  end

  test "should create blog" do
    sign_in @admin

    assert_difference("Blog.count", 1) do
      post blogs_url, params: { blog: { title: "MyString99", body: "MyText" } }
    end
    assert_redirected_to blogs_url
    assert_equal "MyString99 was created.", flash[:notice]
  end

  test "should get edit" do
    sign_in @admin

    get edit_blog_url(@blog)
    assert_response :success
  end

  test "should update blog" do
    sign_in @admin

    assert_difference("Blog.count", 0) do
      put blog_url(@blog),
          params: {
            blog: {
              title: "MyString666",
              body: "MyText666"
            }
          }
    end
    assert_redirected_to blog_url(@blog)
    assert_equal "MyString666 was updated.", flash[:notice]
  end

  test "should destroy blog" do
    sign_in @admin

    assert_difference("Blog.count", -1) { delete blog_url(@blog) }
    assert_redirected_to blogs_url
    assert_equal "MyString was destroyed.", flash[:notice]
  end
end
