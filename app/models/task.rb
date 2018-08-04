# == Schema Information
#
# Table name: tasks
#
#  id          :bigint(8)        not null, primary key
#  period      :integer
#  plan        :string
#  validity    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  campaign_id :integer
#  client_id   :integer
#

class Task < ApplicationRecord
  belongs_to :campaign, dependent: :destroy
  belongs_to :client, dependent: :destroy

  has_many :assignments
end
