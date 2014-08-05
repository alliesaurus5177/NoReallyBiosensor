require 'test_helper'

class NewBiosensorsControllerTest < ActionController::TestCase
  setup do
    @new_biosensor = new_biosensors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:new_biosensors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create new_biosensor" do
    assert_difference('NewBiosensor.count') do
      post :create, new_biosensor: {  }
    end

    assert_redirected_to new_biosensor_path(assigns(:new_biosensor))
  end

  test "should show new_biosensor" do
    get :show, id: @new_biosensor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @new_biosensor
    assert_response :success
  end

  test "should update new_biosensor" do
    patch :update, id: @new_biosensor, new_biosensor: {  }
    assert_redirected_to new_biosensor_path(assigns(:new_biosensor))
  end

  test "should destroy new_biosensor" do
    assert_difference('NewBiosensor.count', -1) do
      delete :destroy, id: @new_biosensor
    end

    assert_redirected_to new_biosensors_path
  end
end
