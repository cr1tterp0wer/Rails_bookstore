# == Schema Information
#
# Table name: purchase_orders
#
#  id         :bigint           not null, primary key
#  po_number  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PurchaseOrder < ApplicationRecord
  validates :po_number, presence: true
  has_one :order, as: :payment_detail, inverse_of: :order
end
