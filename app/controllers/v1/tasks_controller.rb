module V1
  class TasksController < ApiController
    def index
      @tasks = current_user.tasks
    end
  end
end
