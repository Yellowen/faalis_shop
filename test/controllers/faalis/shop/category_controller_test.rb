require 'test_helper'

module Faalis::Shop
  class CategoryControllerTest < ActionController::TestCase
    include Devide::TestHelpers
    tests ::Faalis::Shop::CategoryController

    setup do
      @routes = Engine.routes
      @user   = Fabricate(:user, password: '11111111',
        password_confirmation: '11111111')

      Fabricate(:category, user: @user, title: 'test', permalink: 'test-1', members_only: true, lock: false, description: 'sample desc')

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
