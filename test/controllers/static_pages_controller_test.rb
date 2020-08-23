require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @base_title = "Ruby on Rails Tutorial Sample App"
  end

  def make_assertions(title)
    assert_response :success
    assert_select "title", "#{title} | #{@base_title}"
  end

  test "should get root" do
    get root_url 
    make_assertions("Home")
  end
  
  test "should get home" do
    get static_pages_home_url
    make_assertions("Home")
  end

  test "should get help" do
    get static_pages_help_url
    make_assertions("Help")
  end

  test "should get about" do
    get static_pages_about_url
    make_assertions("About")
  end

  test "should get contact" do
    get static_pages_contact_url
    make_assertions("Contact")
  end

end
