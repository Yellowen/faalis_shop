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

module Faalis::Shop
  class Order < ActiveRecord::Base
    include ::Faalis::Concerns::Authorizable
    include ::SiteFramework::SiteAware

    has_many :order_items
    belongs_to :user, class_name: 'Faalis::User'

    enum status: [:ordered, :payed, :delivered]

    def name
      id
    end
  end
end
