class Check < ApplicationRecord
  has_one :order, as: :paymen_detail 
end
