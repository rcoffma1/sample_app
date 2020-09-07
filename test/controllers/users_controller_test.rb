require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @base_title = "Ruby on Rails Tutorial Sample App"
  end

  def make_assertions(title)
    assert_response :success
    title += title.empty? ? "" : " | "
    assert_select "title", "#{title}#{@base_title}"
  end

  test "should get new" do
    get signup_url
    make_assertions("Sign up")
  end

end
