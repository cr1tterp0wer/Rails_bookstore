# == Schema Information
#
# Table name: checks
#
#  id             :bigint           not null, primary key
#  routing_number :string
#  account_number :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Check < ApplicationRecord
  validates :routing_number, :account_number, presence: true
  has_one :order, as: :payment_detail, dependent: :destroy, inverse_of: :order
end
