# == Schema Information
#
# Table name: assignments
#
#  id                :bigint(8)        not null, primary key
#  collection_entity :string
#  commitment_date   :date
#  due_date          :date
#  email             :string
#  id_number         :integer
#  latitude          :string
#  longitude         :string
#  management_date   :date
#  observations      :string
#  payment_date      :date
#  payment_holder    :string
#  personal_contact  :boolean
#  phone             :string
#  reading_signature :integer
#  stimated_time     :date
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Assignment < ApplicationRecord
end
