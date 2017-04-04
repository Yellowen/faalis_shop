module Faalis::Shop
  class ProductFeature < ActiveRecord::Base
    include ::Faalis::Concerns::Authorizable
    include ::SiteFramework::SiteAware

    belongs_to :feature
    belongs_to :feature_value
    belongs_to :product
    validates_presence_of :value
  end
end
