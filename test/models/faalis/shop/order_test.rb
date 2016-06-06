# == Schema Information
#
# Table name: faalis_shop_orders
#
#  id         :integer          not null, primary key
#  status     :integer
#  tax        :float
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  site_id    :integer
#

require 'test_helper'

module Faalis::Shop
  class OrderTest < ActiveSupport::TestCase

    @@subject = ::Faalis::Shop::Order

    test "won't save without user" do
      subject = @@subject.new(status: :ordered)

      result = subject.save

      assert_not result, msg: 'Order saved without a user.'
    end

  end
end
