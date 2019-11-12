class PurchaseOrder < ApplicationRecord
  has_one :order, as: :payment_detail, inverse_of: :order
end
