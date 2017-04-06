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

    def final_price
      if self.special_price > 0
        if self.tax > 0
          self.special_price + ((self.special_price.to_f / self.tax.to_f) * 100.to_f)
        else
          self.special_price
        end
      else
        if self.tax > 0
          self.price + ((self.special_price.to_f / self.tax.to_f) * 100.to_f) - ((self.special_price.to_f / self.discount.to_f) * 100.to_f)
        else
          self.special_price - ((self.special_price.to_f / self.discount.to_f) * 100.to_f)
        end
      end
    end
  end
end
