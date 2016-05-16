module Faalis::Shop
  class Order < ActiveRecord::Base
    include ::Faalis::Concerns::Authorizable
    include ::SiteFramework::SiteAware

    has_many :order_items
    belongs_to :user, class_name: 'Faalis::User'

    enum status: [ :ordered, :payed, :delivered]
  end
end
