module Faalis::Shop
  class OrderItem < ActiveRecord::Base
    include ::Faalis::Concerns::Authorizable
    include ::SiteFramework::SiteAware

    belongs_to :order
    belongs_to :user, class_name: 'Faalis::User'

    validates_presence_of :quantity
    validates_presence_of :total
    validates_presence_of :order
  end
end
