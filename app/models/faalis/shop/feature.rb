module Faalis::Shop
  class Feature < ActiveRecord::Base
    include ::Faalis::Concerns::Authorizable
    include ::SiteFramework::SiteAware

    validates_presence_of :name

    has_many :feature_values
  end
end
