class ReviewPolicy < ApplicationPolicy
  class ParkingPolicy < ApplicationPolicy
    class Scope < Scope
      def resolve
        scope.all
      end
    end

    def show?
      true
    end

    # def create?
    #   true
    # end
  end
end
