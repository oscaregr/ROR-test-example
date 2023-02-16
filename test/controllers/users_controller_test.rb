require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "get login page" do
    get root_path

    assert_response :success
  end

  test "get create user page" do
    get new_user_path

    assert_response :success
  end

  test "create user" do
    post users_path, params: {
      user: {
        name: 'chido',
        description: 'el chido',
        password: 'chido'
      }
    }

    assert_redirected_to root_path
  end

  test "login user" do
    post root_path, params: {
      name: 'miau',
      password: 'test'
    }

    assert_redirected_to home_index_path
  end

  test "update user" do
    login

    patch user_path(users(:two)), params: {
      user: {
        name: 'hola',
        description: 'hola todos'
      }
    }

    assert_redirected_to home_index_path
  end

  test "delete user" do
    login
    
    assert_difference('User.count', -1) do
      delete user_path(users(:two))
    end

    assert_redirected_to root_path
  end
end
