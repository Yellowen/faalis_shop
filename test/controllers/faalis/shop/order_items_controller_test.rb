require 'test_helper'

module Faalis::Shop
  class OrderStatusControllerTest < ActionController::TestCase
    include Devide::TestHelpers
    tests ::Faalis::Shop::OrderStatusController

    setup do
      @routes = Engine.routes
      @user   = Fabricate(:user, password: '11111111',
        password_confirmation: '11111111')
      @product = Fabricate(:order,
        user: @user,
        name: 'test prdct',
        permalink: 'test-prdct',
        price: 33.5)

      @order = Fabricate(:order,
        :tax 3.5,
        user: @user,
        status: 'ordered')

      Fabricate(:order_items,
        user: @user,
        order: @order,
        product: @product,
        quantity: 3,
        total: 34)

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
