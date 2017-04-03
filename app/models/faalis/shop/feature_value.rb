module Faalis::Shop
  class FeatureValue < ActiveRecord::Base
    belongs_to :feature
    validates_presence_of :name
  end
end
