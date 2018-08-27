# == Schema Information
#
# Table name: result_types
#
#  id                 :bigint(8)        not null, primary key
#  code               :string
#  description        :string
#  name               :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  management_type_id :integer
#

class ResultType < ApplicationRecord
  has_many :tasks
  has_many :anomaly_types
  belongs_to :management_type, required: false

  validates :code, uniqueness: true
  validates :name, uniqueness: true
end
