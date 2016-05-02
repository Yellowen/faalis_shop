# == Schema Information
#
# Table name: faalis_shop_categories
#
#  id           :integer          not null, primary key
#  title        :string
#  description  :text
#  permalink    :string
#  members_only :boolean          default(FALSE)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  domain_id    :integer
#

module Faalis::Shop
  class Category < ActiveRecord::Base
    include ::Faalis::Concerns::Authorizable
    include ::SiteFramework::DomainAware

    validates :permalink, uniqueness: true

    has_many :posts, class_name: 'Faalis::Shop::Post'

    validates_presence_of :title
    validates_presence_of :permalink

    def name
      title
    end
  end
end