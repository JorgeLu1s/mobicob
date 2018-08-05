module V1
  class AssignmentsController < ApiController
    def index
      @assignments = current_user.assignments
    end
  end
end
