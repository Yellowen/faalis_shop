module Faalis::Shop
  class Shop::FeatureValuePolicy < ApplicationPolicy
    class Scope < Scope
      def resolve
        scope
      end
    end
  end
end
