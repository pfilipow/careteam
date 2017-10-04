require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create(:user)

    
  end

  test "signup new user" do
    post user_registration_url, params: { user: { email: "user-nonexist@example.org" } }
    assert_response :success
  end

  test "update success" do
    sign_in @user
    put user_registration_url, params: { user: { email: @user.email, first_name: "test first name" } }
    assert_response :success
  end
end
