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

require 'test_helper'

class AnomalyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
