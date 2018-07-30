# == Schema Information
#
# Table name: campaigns
#
#  id          :bigint(8)        not null, primary key
#  finish_date :date
#  init_date   :date
#  number      :integer
#  source      :string
#  state       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Campaign < ApplicationRecord
  has_many :tasks
end
