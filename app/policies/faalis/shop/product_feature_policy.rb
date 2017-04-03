module Faalis::Shop
  class ProductFeaturePolicy < ApplicationPolicy
    class Scope < Scope
      def resolve
        scope
      end
    end
  end
end
