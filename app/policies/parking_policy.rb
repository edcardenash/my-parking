class ParkingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end

    def show?
      true
    end

    def create?
      true
    end
  end
end
