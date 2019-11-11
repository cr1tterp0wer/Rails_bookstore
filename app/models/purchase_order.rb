class PurchaseOrder < ApplicationRecord
 has_one :order, as: :paymen_detail 
end
