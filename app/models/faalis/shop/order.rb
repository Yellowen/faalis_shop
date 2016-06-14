# -*- coding: utf-8 -*-
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
#  site_id    :integerذ
#

module Faalis::Shop
  class Order < ActiveRecord::Base
    include ::Faalis::Concerns::Authorizable
    include ::SiteFramework::SiteAware

    validate :unique_unpayed_order
    has_many :order_items
    belongs_to :user, class_name: 'Faalis::User'

    enum status: [:ordered, :payed, :delivered, :canceled]

    def name
      id
    end

    private

    def unique_unpayed_order
      if status == "ordered"
        unpayed_order = Order.find_by(status: :ordered, user_id: user.id)
        if !unpayed_order.nil?
          errors.add(:status, s("You have an unpayed order.pay or cancel it before"))
        end
      end
    end
  end
end
