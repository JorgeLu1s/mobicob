class RemoveUsernameAndCreationFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :creation
    remove_column :users, :username
  end
end
