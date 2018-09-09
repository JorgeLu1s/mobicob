# == Schema Information
#
# Table name: result_anomaly_matches
#
#  id              :bigint(8)        not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  anomaly_type_id :bigint(8)
#  result_type_id  :bigint(8)
#
# Indexes
#
#  index_result_anomaly_matches_on_anomaly_type_id  (anomaly_type_id)
#  index_result_anomaly_matches_on_result_type_id   (result_type_id)
#
# Foreign Keys
#
#  fk_rails_...  (anomaly_type_id => anomaly_types.id)
#  fk_rails_...  (result_type_id => result_types.id)
#

class ResultAnomalyMatch < ApplicationRecord
  belongs_to :result_type
  belongs_to :anomaly_type
end
