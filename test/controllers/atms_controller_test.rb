require 'test_helper'

class AtmsControllerTest < ActionController::TestCase
  setup do
    @atm = atms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:atms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create atm" do
    assert_difference('Atm.count') do
      post :create, atm: { bank_id: @atm.bank_id, location: @atm.location }
    end

    assert_redirected_to atm_path(assigns(:atm))
  end

  test "should show atm" do
    get :show, id: @atm
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @atm
    assert_response :success
  end

  test "should update atm" do
    patch :update, id: @atm, atm: { bank_id: @atm.bank_id, location: @atm.location }
    assert_redirected_to atm_path(assigns(:atm))
  end

  test "should destroy atm" do
    assert_difference('Atm.count', -1) do
      delete :destroy, id: @atm
    end

    assert_redirected_to atms_path
  end
end
