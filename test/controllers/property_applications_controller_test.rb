require 'test_helper'

class PropertyApplicationsControllerTest < ActionController::TestCase
  setup do
    @property_application = property_applications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:property_applications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create property_application" do
    assert_difference('PropertyApplication.count') do
      post :create, property_application: { attends_a_school: @property_application.attends_a_school, email: @property_application.email, first_name: @property_application.first_name, last_name: @property_application.last_name, number_of_cotenants: @property_application.number_of_cotenants, phone_number: @property_application.phone_number, planned_graduation_date: @property_application.planned_graduation_date, property_id: @property_application.property_id, school: @property_application.school, start_date: @property_application.start_date }
    end

    assert_redirected_to property_application_path(assigns(:property_application))
  end

  test "should show property_application" do
    get :show, id: @property_application
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @property_application
    assert_response :success
  end

  test "should update property_application" do
    patch :update, id: @property_application, property_application: { attends_a_school: @property_application.attends_a_school, email: @property_application.email, first_name: @property_application.first_name, last_name: @property_application.last_name, number_of_cotenants: @property_application.number_of_cotenants, phone_number: @property_application.phone_number, planned_graduation_date: @property_application.planned_graduation_date, property_id: @property_application.property_id, school: @property_application.school, start_date: @property_application.start_date }
    assert_redirected_to property_application_path(assigns(:property_application))
  end

  test "should destroy property_application" do
    assert_difference('PropertyApplication.count', -1) do
      delete :destroy, id: @property_application
    end

    assert_redirected_to property_applications_path
  end
end
