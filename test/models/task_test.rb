# == Schema Information
#
# Table name: tasks
#
#  id          :bigint(8)        not null, primary key
#  period      :integer
#  plan        :string
#  validity    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  campaign_id :integer
#  client_id   :integer
#

require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
