# == Schema Information
#
# Table name: result_types
#
#  id          :bigint(8)        not null, primary key
#  code        :string
#  description :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class ResultType < ApplicationRecord
  has_many :tasks

  validates :code, uniqueness: true
  validates :name, uniqueness: true
end
