# == Schema Information
#
# Table name: contractors
#
#  id         :bigint(8)        not null, primary key
#  code       :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Contractor < ApplicationRecord
  has_many :users, dependent: :destroy

  validates :code, uniqueness: true
  validates :name, uniqueness: true
end
