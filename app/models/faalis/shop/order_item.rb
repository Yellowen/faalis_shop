# == Schema Information
#
# Table name: faalis_shop_order_items
#
#  id         :integer          not null, primary key
#  quantity   :integer
#  total      :integer
#  product_id :integer
#  user_id    :integer
#  order_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  site_id    :integer
#

module Faalis::Shop
  class OrderItem < ActiveRecord::Base
    include ::Faalis::Concerns::Authorizable
    include ::SiteFramework::SiteAware

    belongs_to :order
    belongs_to :product
    belongs_to :user, class_name: 'Faalis::User'

    validates_presence_of :quantity
    validates_presence_of :total
    validates_presence_of :order
  end
end
