require 'test_helper'

module Faalis::Shop
  class ProductTest < ActiveSupport::TestCase

    @@subject = ::Faalis::Shop::Product

    before do
      @user     = Fabricate(:user, password: '11111111',
        password_confirmation: '11111111')
      @category = Fabricate(:category)
    end


    test "won't save without a title" do
      subject = @@subject.new(user: @user,
        category: @category)

      result = subject.save

      assert_not result, msg: 'Product saved whithout name.'
    end


    test "won't save without a user" do
      subject = @@subject.new(name: 'product-1',
        category: @category)

      failed = false
      begin
        subject.save
      rescue Exception => e
        assert_equal ActiveRecord::StatementInvalid, e.class
        failed = true
      end

      assert failed, msg: 'Product should not save without a user'
    end

    test "won't save without a category" do
      subject = @@subject.new(name: 'product-1',
        user: @user)

      failed = false
      begin
        subject.save
      rescue Exception => e
        assert_equal ActiveRecord::StatementInvalid, e.class
        failed = true
      end

      assert failed, msg: 'Product should not save without a user'
    end

  end
end
