# == Schema Information
#
# Table name: delegations
#
#  id         :bigint(8)        not null, primary key
#  code       :integer
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Delegation < ApplicationRecord
  has_many :clients
end
