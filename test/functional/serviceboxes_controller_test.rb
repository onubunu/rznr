require 'test_helper'

class ServiceboxesControllerTest < ActionController::TestCase
  setup do
    @servicebox = serviceboxes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:serviceboxes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create servicebox" do
    assert_difference('Servicebox.count') do
      post :create, servicebox: { serviceboximage: @servicebox.serviceboximage, serviceboxtext: @servicebox.serviceboxtext, serviceboxtitle: @servicebox.serviceboxtitle }
    end

    assert_redirected_to servicebox_path(assigns(:servicebox))
  end

  test "should show servicebox" do
    get :show, id: @servicebox
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @servicebox
    assert_response :success
  end

  test "should update servicebox" do
    put :update, id: @servicebox, servicebox: { serviceboximage: @servicebox.serviceboximage, serviceboxtext: @servicebox.serviceboxtext, serviceboxtitle: @servicebox.serviceboxtitle }
    assert_redirected_to servicebox_path(assigns(:servicebox))
  end

  test "should destroy servicebox" do
    assert_difference('Servicebox.count', -1) do
      delete :destroy, id: @servicebox
    end

    assert_redirected_to serviceboxes_path
  end
end
