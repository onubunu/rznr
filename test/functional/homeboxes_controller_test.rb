require 'test_helper'

class HomeboxesControllerTest < ActionController::TestCase
  setup do
    @homebox = homeboxes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:homeboxes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create homebox" do
    assert_difference('Homebox.count') do
      post :create, homebox: { homeboximage: @homebox.homeboximage, homeboxtest: @homebox.homeboxtest, homeboxtitle: @homebox.homeboxtitle }
    end

    assert_redirected_to homebox_path(assigns(:homebox))
  end

  test "should show homebox" do
    get :show, id: @homebox
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @homebox
    assert_response :success
  end

  test "should update homebox" do
    put :update, id: @homebox, homebox: { homeboximage: @homebox.homeboximage, homeboxtest: @homebox.homeboxtest, homeboxtitle: @homebox.homeboxtitle }
    assert_redirected_to homebox_path(assigns(:homebox))
  end

  test "should destroy homebox" do
    assert_difference('Homebox.count', -1) do
      delete :destroy, id: @homebox
    end

    assert_redirected_to homeboxes_path
  end
end
