require 'test_helper'

class HomeslidersControllerTest < ActionController::TestCase
  setup do
    @homeslider = homesliders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:homesliders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create homeslider" do
    assert_difference('Homeslider.count') do
      post :create, homeslider: { sliderimage: @homeslider.sliderimage, sliderlink: @homeslider.sliderlink, slidertext: @homeslider.slidertext }
    end

    assert_redirected_to homeslider_path(assigns(:homeslider))
  end

  test "should show homeslider" do
    get :show, id: @homeslider
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @homeslider
    assert_response :success
  end

  test "should update homeslider" do
    put :update, id: @homeslider, homeslider: { sliderimage: @homeslider.sliderimage, sliderlink: @homeslider.sliderlink, slidertext: @homeslider.slidertext }
    assert_redirected_to homeslider_path(assigns(:homeslider))
  end

  test "should destroy homeslider" do
    assert_difference('Homeslider.count', -1) do
      delete :destroy, id: @homeslider
    end

    assert_redirected_to homesliders_path
  end
end
