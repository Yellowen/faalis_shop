module Faalis::Shop
  class Faalis::Shop::OrderItemsPolicy < ApplicationPolicy
    class Scope < Scope
      def resolve
        scope
      end
    end
  end
end
