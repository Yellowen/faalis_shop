require 'test_helper'

module Faalis::Shop
  class OrderItemTest < ActiveSupport::TestCase

    @@subject = ::Faalis::Shop::OrderItemTest

    before do
      @order = Fabricate(:order)
      @product = Fabricate(:product)
    end

    test "won't save without a user" do
      subject = @@subject.new(product: @product,
        order: @order, quantity: 4)

      failed = false
      begin
        subject.save
      rescue Exception => e
        assert_equal ActiveRecord::StatementInvalid, e.class
        failed = true
      end

      assert failed, msg: 'Order item should not save without a user'
    end

    test "won't save without a order" do
      subject = @@subject.new(product: @product,
        user: @user, quantity: 4, total: 2)

      failed = false
      begin
        subject.save
      rescue Exception => e
        assert_equal ActiveRecord::StatementInvalid, e.class
        failed = true
      end

      assert failed, msg: 'Order item should not save without an order'
    end

    test "won't save without total" do
      subject = @@subject.new(product: @product,
        user: @user, quantity: 4, order: @order, total: 2)

      failed = false
      begin
        subject.save
      rescue Exception => e
        assert_equal ActiveRecord::StatementInvalid, e.class
        failed = true
      end

      assert failed, msg: 'Order item should not save without an total'
    end

    test "won't save without a product" do
      subject = @@subject.new(order: @order,
        user: @user, quantity: 4, total: 2)

      failed = false
      begin
        subject.save
      rescue Exception => e
        assert_equal ActiveRecord::StatementInvalid, e.class
        failed = true
      end

      assert failed, msg: 'Order item should not save without an product'
    end
  end
end
