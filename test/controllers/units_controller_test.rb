require 'test_helper'

class UnitsControllerTest < ActionController::TestCase
  setup do
    @unit = units(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:units)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create unit" do
    assert_difference('Unit.count') do
      post :create, unit: { date_available: @unit.date_available, description: @unit.description, number: @unit.number, property_id: @unit.property_id, rent: @unit.rent, security_deposit: @unit.security_deposit, unit_type: @unit.unit_type }
    end

    assert_redirected_to unit_path(assigns(:unit))
  end

  test "should show unit" do
    get :show, id: @unit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @unit
    assert_response :success
  end

  test "should update unit" do
    patch :update, id: @unit, unit: { date_available: @unit.date_available, description: @unit.description, number: @unit.number, property_id: @unit.property_id, rent: @unit.rent, security_deposit: @unit.security_deposit, unit_type: @unit.unit_type }
    assert_redirected_to unit_path(assigns(:unit))
  end

  test "should destroy unit" do
    assert_difference('Unit.count', -1) do
      delete :destroy, id: @unit
    end

    assert_redirected_to units_path
  end
end
