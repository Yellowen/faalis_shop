module Faalis::Blog
  class CategoryPolicy < ::ApplicationPolicy
    class Scope < Scope
      def resolve
        scope
      end
    end
  end
end
