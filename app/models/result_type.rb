# == Schema Information
#
# Table name: result_types
#
#  id          :bigint(8)        not null, primary key
#  code        :string
#  description :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class ResultType < ApplicationRecord
  has_many :tasks
  has_many :management_result_matches, dependent: :destroy
  has_many :result_anomaly_matches, dependent: :destroy
  has_many :management_types, through: :management_result_matches
  has_many :anomaly_types, through: :result_anomaly_matches

  accepts_nested_attributes_for :management_result_matches, allow_destroy: true

  validates :code, uniqueness: true
  validates :name, uniqueness: true
end
