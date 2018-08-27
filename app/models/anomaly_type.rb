# == Schema Information
#
# Table name: anomaly_types
#
#  id             :bigint(8)        not null, primary key
#  code           :string
#  description    :string
#  name           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  result_type_id :integer
#

class AnomalyType < ApplicationRecord
  has_many :tasks
  belongs_to :result_type, required: false

  validates :code, uniqueness: true
  validates :name, uniqueness: true
end
