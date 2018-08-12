# == Schema Information
#
# Table name: tasks
#
#  id                 :bigint(8)        not null, primary key
#  collection_entity  :string
#  commitment_date    :date
#  dataphone_payment  :boolean
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
#  period             :integer
#  personal_contact   :boolean
#  phone              :string
#  plan               :string
#  reading_signature  :integer
#  used_time          :time
#  validity           :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  anomaly_type_id    :integer
#  campaign_id        :integer
#  client_id          :integer
#  management_type_id :integer
#  result_type_id     :integer
#  user_id            :integer
#

class Task < ApplicationRecord
  belongs_to :campaign
  belongs_to :client
  belongs_to :user, required: false

  belongs_to :management_type, required: false
  belongs_to :result_type, required: false
  belongs_to :anomaly_type, required: false

  enum validity: { daily: "daily", weekly: "weekly", monthly: "monthly" }

  def to_s
    "#{campaign.number}-#{id}"
   end
end
