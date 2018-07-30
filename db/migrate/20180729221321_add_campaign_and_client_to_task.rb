class AddCampaignAndClientToTask < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :campaign_id, :integer
    add_column :tasks, :client_id, :integer
  end
end
