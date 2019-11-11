class CreditCard < ApplicationRecord
  has_one :order, as: :paymen_detail 
end
