class Check < ApplicationRecord
  has_one :order, as: :payment_detail, dependent: :destroy, inverse_of: :order
end
