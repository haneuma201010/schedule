require 'test_helper'

class SchoolUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get school_users_home_url
    assert_response :success
  end

end
