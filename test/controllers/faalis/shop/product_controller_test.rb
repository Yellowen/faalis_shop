require 'test_helper'

module Faalis::Shop
  class ProductControllerTest < ActionController::TestCase
    include Devide::TestHelpers
    tests ::Faalis::Shop::ProductController

    setup do
      @routes = Engine.routes
      @user   = Fabricate(:user, password: '11111111',
        password_confirmation: '11111111')
      @category = Fabricate(:category, user: @user, title: 'test category', permalink: 'test-category', members_only: false)

      Fabricate(:product, user: @user, name: 'test', permalink: 'test-1', category: @category, price: 343, lock: false, description: 'sample desc')

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
