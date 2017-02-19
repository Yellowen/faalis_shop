# == Schema Information
#
# Table name: faalis_shop_products
#
#  id          :integer          not null, primary key
#  name        :string
#  price       :float
#  category_id :integer
#  lock        :boolean
#  private     :boolean
#  description :text
#  permalink   :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#  site_id     :integer
#

module Faalis::Shop
  class Product < ActiveRecord::Base
    include ::Faalis::Concerns::Authorizable
    include ::SiteFramework::SiteAware

    belongs_to :category
    belongs_to :user, class_name: 'Faalis::User'
    has_many :product_images, class_name: 'Faalis::Shop::Product'

    validates_presence_of :name
    validates_presence_of :category_id
    validates_presence_of :permalink
    validates :permalink, uniqueness: true
    validates_presence_of :permalink

    scope :available, -> { where(lock: false) }
  end
end
