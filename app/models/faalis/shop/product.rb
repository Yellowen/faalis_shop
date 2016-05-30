module Faalis::Shop
  class Product < ActiveRecord::Base
    include ::Faalis::Concerns::Authorizable
    include ::SiteFramework::SiteAware

    belongs_to :category
    belongs_to :user, class_name: 'Faalis::User'

    validates_presence_of :name
    validates_presence_of :category_id
    validates_presence_of :permalink
    validates :permalink, uniqueness: true
    validates_presence_of :permalink

    scope :available, -> { where(lock: false) }
  end
end
