module Faalis::Shop
  class Faais::Shop::OrderItemsPolicy < ApplicationPolicy
    class Scope < Scope
      def resolve
        scope
      end
    end
  end
end
