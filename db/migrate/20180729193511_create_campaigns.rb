class CreateCampaigns < ActiveRecord::Migration[5.2]
  def change
    create_table :campaigns do |t|
      t.integer :number
      t.string :source
      t.string :state
      t.date :init_date
      t.date :finish_date

      t.timestamps
    end
  end
end
