module V1
  class TasksController < ApiController
    def index
      @tasks = current_user.tasks
    end

    def upload_tasks
      params[:tasks].each do |task|
        Task.find(task[:id]).update(task_params(task))
      end

      render status: :ok
    end

    private

    def task_params(my_params)
      my_params.require(:task).permit(:id, :collection_entity, :commitment_date, :dataphone_payment, :due_date,
                                     :email, :estimated_date, :id_number, :latitude, :longitude, :management_date,
                                     :observations, :payment_date, :payment_holder, :period, :personal_contact,
                                     :phone, :plan, :reading_signature, :validity, :anomaly_type_id, :campaign_id,
                                     :client_id, :management_type_id, :result_type_id, :user_id)
    end
  end
end
