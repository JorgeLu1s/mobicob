# == Schema Information
#
# Table name: management_types
#
#  id          :bigint(8)        not null, primary key
#  code        :string
#  description :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class ManagementType < ApplicationRecord
  has_many :tasks
  has_many :result_types

  validates :code, uniqueness: true
  validates :name, uniqueness: true
end
