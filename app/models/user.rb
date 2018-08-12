# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  active                 :boolean
#  address                :string
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :inet
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  id_number              :integer
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :inet
#  lastname               :string
#  latitude               :string
#  longitude              :string
#  name                   :string
#  password               :string
#  phone                  :string
#  position               :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  contractor_id          :integer
#  delegation_id          :integer
#  role_id                :integer
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :role
  belongs_to :contractor
  belongs_to :delegation

  has_many :tasks

  validates :email, uniqueness: true
  validates :id_number, uniqueness: true
end
