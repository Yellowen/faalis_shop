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
    has_many :product_images, class_name: 'Faalis::Shop::ProductImage'
    has_many :product_features, class_name: 'Faalis::Shop::ProductFeature'
    validates_presence_of :name
    validates_presence_of :category_id
    validates_presence_of :permalink
    validates :permalink, uniqueness: true
    validates_presence_of :permalink

    scope :available, -> { where(lock: false) }

    # Price + tax without discount and special offers
    def price_with_tax
      unless self.tax.nil? || self.tax <= 0
        (self.price + ((self.price / 100) * self.tax)).ceil
      else
        self.price
      end
    end

    def final_price
      unless self.special_price.nil? || self.special_price <= 0
        unless self.tax.nil? || self.tax <= 0
          (self.special_price + ((self.special_price / 100) * self.tax)).ceil
        else
          self.special_price.ceil
        end
      else
        unless self.tax.nil? || self.tax <= 0
          price = self.price - ((self.price / 100) * self.discount.to_i)
          price + ((price / 100) * self.tax).ceil
        else
          (self.price - ((self.price / 100) * self.discount.to_i)).ceil
        end
      end
    end
  end
end
