module Faalis::Shop
  class Feature < ActiveRecord::Base
    validates_presence_of :name

    has_many :feature_values
  end
end
