# == Schema Information
#
# Table name: anomaly_types
#
#  id          :bigint(8)        not null, primary key
#  code        :string
#  description :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class AnomalyType < ApplicationRecord
  has_many :tasks
  has_many :result_anomaly_matches, dependent: :destroy
  has_many :result_types, through: :result_anomaly_matches

  accepts_nested_attributes_for :result_anomaly_matches, allow_destroy: true

  validates :code, uniqueness: true
  validates :name, uniqueness: true
end
