require 'test_helper'

class GuestsControllerTest < ActionController::TestCase
  setup do
    @weddings = weddings(:one)
    @guest = guests(:one)
  end

  test "should get index" do
    get :index, params: { weddings_id: @weddings }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { weddings_id: @weddings }
    assert_response :success
  end

  test "should create guest" do
    assert_difference('Guest.count') do
      post :create, params: { weddings_id: @weddings, guest: @guest.attributes }
    end

    assert_redirected_to weddings_guest_path(@weddings, Guest.last)
  end

  test "should show guest" do
    get :show, params: { weddings_id: @weddings, id: @guest }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { weddings_id: @weddings, id: @guest }
    assert_response :success
  end

  test "should update guest" do
    put :update, params: { weddings_id: @weddings, id: @guest, guest: @guest.attributes }
    assert_redirected_to weddings_guest_path(@weddings, Guest.last)
  end

  test "should destroy guest" do
    assert_difference('Guest.count', -1) do
      delete :destroy, params: { weddings_id: @weddings, id: @guest }
    end

    assert_redirected_to weddings_guests_path(@weddings)
  end
end
