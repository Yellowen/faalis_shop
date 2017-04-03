module Faalis::Shop
  class FeatureValuePolicy < ApplicationPolicy
    class Scope < Scope
      def resolve
        scope
      end
    end
  end
end
