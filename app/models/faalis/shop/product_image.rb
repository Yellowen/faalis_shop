module Faalis::Shop
  class ProductImage < ActiveRecord::Base
    include ::Faalis::Concerns::Authorizable
    include ::SiteFramework::SiteAware

    validates_presence_of :title
    validates_presence_of :image

  end
end
