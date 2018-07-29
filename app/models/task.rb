# == Schema Information
#
# Table name: tasks
#
#  id         :bigint(8)        not null, primary key
#  period     :integer
#  plan       :string
#  validity   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Task < ApplicationRecord
end
