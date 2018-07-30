# == Schema Information
#
# Table name: clients
#
#  id                :bigint(8)        not null, primary key
#  AOL               :integer
#  CGV               :string
#  NIC               :integer
#  NIS               :integer
#  address           :string
#  agreed_bills      :integer
#  corregimiento     :string
#  dataphone_payment :boolean
#  departament       :string
#  duplicator        :string
#  energy_debt       :integer
#  financed_debt     :integer
#  id_number         :integer
#  irregular_debt    :integer
#  measurer          :string
#  measurer_brand    :string
#  measurer_type     :string
#  municipality      :string
#  name              :string
#  neighborhood      :string
#  number            :integer
#  overdue_bills     :integer
#  phone             :string
#  rate              :string
#  reading_itinerary :integer
#  route             :integer
#  state             :string
#  street_name       :string
#  street_type       :string
#  third_party_debt  :integer
#  unicom            :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  delegation_id     :integer
#

require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
