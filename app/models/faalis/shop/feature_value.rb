module Faalis::Shop
  class FeatureValue < ActiveRecord::Base
    include ::Faalis::Concerns::Authorizable
    include ::SiteFramework::SiteAware

    belongs_to :feature
    validates_presence_of :name
  end
end
