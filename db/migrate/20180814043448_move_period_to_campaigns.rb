class MovePeriodToCampaigns < ActiveRecord::Migration[5.2]
  def change
    remove_column :tasks, :period
    add_column :campaigns, :period, :integer
  end
end
