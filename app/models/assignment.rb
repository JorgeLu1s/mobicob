# == Schema Information
#
# Table name: assignments
#
#  id                 :bigint(8)        not null, primary key
#  collection_entity  :string
#  commitment_date    :date
#  due_date           :date
#  email              :string
#  estimated_time     :time
#  id_number          :integer
#  latitude           :string
#  longitude          :string
#  management_date    :date
#  observations       :string
#  payment_date       :date
#  payment_holder     :string
#  personal_contact   :boolean
#  phone              :string
#  reading_signature  :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  anomaly_type_id    :integer
#  management_type_id :integer
#  result_type_id     :integer
#  task_id            :integer
#  user_id            :integer
#

class Assignment < ApplicationRecord
  belongs_to :task, dependent: :destroy
  belongs_to :user, dependent: :destroy

  belongs_to :management_type, dependent: :destroy, required: false
  belongs_to :result_type, dependent: :destroy, required: false
  belongs_to :anomaly_type, dependent: :destroy, required: false

  def to_s
    "#{task.campaign.number}-#{task.id}-#{id}"
   end
end
