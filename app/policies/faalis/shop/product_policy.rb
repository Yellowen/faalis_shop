class Faalis::Shop::ProductPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
end
