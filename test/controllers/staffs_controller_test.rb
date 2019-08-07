require 'test_helper'

class StaffsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @staff = staffs(:one)
  end

  test "should get index" do
    get staffs_url, as: :json
    assert_response :success
  end

  test "should create staff" do
    assert_difference('Staff.count') do
      post staffs_url, params: { staff: { email: @staff.email, first_name: @staff.first_name, last_name: @staff.last_name, phone: @staff.phone, title: @staff.title } }, as: :json
    end

    assert_response 201
  end

  test "should show staff" do
    get staff_url(@staff), as: :json
    assert_response :success
  end

  test "should update staff" do
    patch staff_url(@staff), params: { staff: { email: @staff.email, first_name: @staff.first_name, last_name: @staff.last_name, phone: @staff.phone, title: @staff.title } }, as: :json
    assert_response 200
  end

  test "should destroy staff" do
    assert_difference('Staff.count', -1) do
      delete staff_url(@staff), as: :json
    end

    assert_response 204
  end
end
