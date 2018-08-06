class AddDataphonePaymentToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :dataphone_payment, :boolean
    remove_column :clients, :dataphone_payment
  end
end
