require 'test_helper'

module Faalis::Blog
  class PostsControllerTest < ::ActionController::TestCase
    include Devise::TestHelpers
    tests ::Faalis::Blog::PostsController

    setup do
      @routes = Engine.routes
      @user   = Fabricate(:user, password: '11111111',
        password_confirmation: '11111111')
      @category1 = Fabricate(:category, title: 'ex1', permalink: 'ex-1')
      @category2 = Fabricate(:category, title: 'ex2', permalink: 'ex-2', members_only: true)


      3.times do
        Fabricate(:post, user: @user, category: @category1, published: true)
        Fabricate(:post, user: @user, category: @category2, published: true)
      end

      Fabricate(:post, user: @user, category: @category1,
        published: true, members_only: true)
      Fabricate(:post, user: @user, category: @category2,
        published: true, members_only: true)

      Fabricate(:post, user: @user, category: @category1,
        published: true, members_only: false)
      Fabricate(:post, user: @user, category: @category2,
        published: true, members_only: false)

      Fabricate(:post, user: @user, category: @category1,
        published: false, members_only: false)
      Fabricate(:post, user: @user, category: @category2,
        published: false, members_only: false)

      Faalis::Engine.amd = false

    end


    test "is successful" do
      get :index
      assert_response :success
    end

    test "returns only published posts" do
      get :index

      assert_response :success
      assert_not_nil :posts
      assert_equal 8, assigns(:posts).length
    end

    test "returns only published posts with private posts if user was logged in" do
      sign_in(@user)

      get :index

      assert_response :success
      assert_not_nil :posts
      assert_equal 10, assigns(:posts).length
    end

    test "should get show" do
      get :show
      assert_response :success
    end


  end
end
