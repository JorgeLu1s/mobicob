# == Schema Information
#
# Table name: anomalies
#
#  id          :bigint(8)        not null, primary key
#  code        :integer
#  description :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Anomaly < ApplicationRecord
end
