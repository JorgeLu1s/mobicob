# == Schema Information
#
# Table name: anomaly_types
#
#  id          :bigint(8)        not null, primary key
#  code        :integer
#  description :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class AnomalyType < ApplicationRecord
  has_many :assignments
end
