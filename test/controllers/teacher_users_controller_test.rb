require 'test_helper'

class TeacherUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get teacher_users_new_url
    assert_response :success
  end

end
