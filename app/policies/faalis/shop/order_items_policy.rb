module Faalis::Shop
  class Shop::OrderItemsPolicy < ApplicationPolicy
    class Scope < Scope
      def resolve
        scope
      end
    end
  end
end
