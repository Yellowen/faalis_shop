module Faalis::Shop
  class OrderItem < ActiveRecord::Base
    belongs_to :order
    belongs_to :user, class_name: 'Faalis::User'

  end
end
