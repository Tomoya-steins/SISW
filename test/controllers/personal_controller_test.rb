require 'test_helper'

class PersonalControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get personal_show_url
    assert_response :success
  end

  test "should get edit" do
    get personal_edit_url
    assert_response :success
  end

end
