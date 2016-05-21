require 'test_helper'

module Faalis::Shop
  class OrderControllerTest < ActionController::TestCase
    setup do
      @routes = Engine.routes
      @user   = Fabricate(:user, password: '11111111',
        password_confirmation: '11111111')

      Fabricate(:order, user: @user, status: 'ordered', tax: 3.54)

      Faalis::Engine.amd = false
    end

    test "is successful" do
      get :index
      assert_response :success
    end

    test "should get show" do
      get :show
      assert_response :success
    end
  end


end
