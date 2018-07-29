# == Schema Information
#
# Table name: management_types
#
#  id          :bigint(8)        not null, primary key
#  code        :integer
#  description :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class ManagementTypeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
