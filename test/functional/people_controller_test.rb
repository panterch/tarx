require 'test_helper'

class PeopleControllerTest < ActionController::TestCase

  test "index action" do
    p = Factory(:person)
    get :index
    assert_redirected_to person_url(p)
  end

  test "render show action" do
    p = Factory(:person)
    get :show, :id => p.id
    assert_response :success
  end

  test "find by id" do
    p = Factory(:person)
    get :show, :id => p.id
    assert_equal p, assigns(:person)
  end

  test "find by code" do
    p = Factory(:person, :code => 'YYY')
    get :show, :id => 'YYY'
    assert_equal p, assigns(:person)
  end

end
