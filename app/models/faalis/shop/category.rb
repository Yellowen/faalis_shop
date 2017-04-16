# == Schema Information
#
# Table name: faalis_shop_categories
#
#  id           :integer          not null, primary key
#  title        :string
#  description  :text
#  permalink    :string
#  parent_id    :integer
#  lock         :boolean          default(TRUE)
#  members_only :boolean          default(FALSE)
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  domain_id    :integer
#

module Faalis::Shop
  class Category < ActiveRecord::Base
    include ::Faalis::Concerns::Authorizable
    include ::SiteFramework::SiteAware

    belongs_to :parent, class_name: self.to_s
    belongs_to :user, class_name: '::Faalis::User'
    has_many :products, class_name: 'Faalis::Shop::Product'

    validates_presence_of :title
    validates_presence_of :permalink
    validates :permalink, uniqueness: true


    scope :available, -> { where(lock: false) }
    scope :visible, lambda { |signed_in| signed_in ? all : where(members_only: false) }

    def name
      title
    end

    def locked?
      lock
    end

    def memebers_only?
      members_only
    end
  end
end
