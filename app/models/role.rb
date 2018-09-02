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

  validates :code, uniqueness: true
  validates :name, uniqueness: true

  before_update :validate_update_code_for_basics
  before_destroy :validate_destroy_for_basics

  enum basic_role: { admin: "1", back: "2", web: "3", mobile: "4" }

  def validate_update_code_for_basics
    if code_changed? and Role.basic_roles.values.include?(code_was)
      errors.add(:Error, "You can't change the code for this Role")
      throw :abort
    end
  end

  def validate_destroy_for_basics
    if Role.basic_roles.values.include?(code_was)
      errors.add(:Error, "You can't change the code for this Role")
      throw :abort
    end
  end
end
