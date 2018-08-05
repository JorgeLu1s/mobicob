# == Schema Information
#
# Table name: roles
#
#  id          :bigint(8)        not null, primary key
#  code        :string
#  description :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Role < ApplicationRecord
  has_many :users
end
