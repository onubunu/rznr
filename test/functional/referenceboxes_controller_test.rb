require 'test_helper'

class ReferenceboxesControllerTest < ActionController::TestCase
  setup do
    @referencebox = referenceboxes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:referenceboxes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create referencebox" do
    assert_difference('Referencebox.count') do
      post :create, referencebox: { referenceimage: @referencebox.referenceimage, referencetext: @referencebox.referencetext, referencetitle: @referencebox.referencetitle }
    end

    assert_redirected_to referencebox_path(assigns(:referencebox))
  end

  test "should show referencebox" do
    get :show, id: @referencebox
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @referencebox
    assert_response :success
  end

  test "should update referencebox" do
    put :update, id: @referencebox, referencebox: { referenceimage: @referencebox.referenceimage, referencetext: @referencebox.referencetext, referencetitle: @referencebox.referencetitle }
    assert_redirected_to referencebox_path(assigns(:referencebox))
  end

  test "should destroy referencebox" do
    assert_difference('Referencebox.count', -1) do
      delete :destroy, id: @referencebox
    end

    assert_redirected_to referenceboxes_path
  end
end
