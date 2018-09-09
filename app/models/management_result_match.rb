# == Schema Information
#
# Table name: management_result_matches
#
#  id                 :bigint(8)        not null, primary key
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  management_type_id :bigint(8)
#  result_type_id     :bigint(8)
#
# Indexes
#
#  index_management_result_matches_on_management_type_id  (management_type_id)
#  index_management_result_matches_on_result_type_id      (result_type_id)
#
# Foreign Keys
#
#  fk_rails_...  (management_type_id => management_types.id)
#  fk_rails_...  (result_type_id => result_types.id)
#

class ManagementResultMatch < ApplicationRecord
  belongs_to :management_type
  belongs_to :result_type
end
