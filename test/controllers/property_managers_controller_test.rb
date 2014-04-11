require 'test_helper'

class PropertyManagersControllerTest < ActionController::TestCase
  setup do
    @property_manager = property_managers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:property_managers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create property_manager" do
    assert_difference('PropertyManager.count') do
      post :create, property_manager: { description: @property_manager.description, name: @property_manager.name }
    end

    assert_redirected_to property_manager_path(assigns(:property_manager))
  end

  test "should show property_manager" do
    get :show, id: @property_manager
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @property_manager
    assert_response :success
  end

  test "should update property_manager" do
    patch :update, id: @property_manager, property_manager: { description: @property_manager.description, name: @property_manager.name }
    assert_redirected_to property_manager_path(assigns(:property_manager))
  end

  test "should destroy property_manager" do
    assert_difference('PropertyManager.count', -1) do
      delete :destroy, id: @property_manager
    end

    assert_redirected_to property_managers_path
  end
end
