# == Schema Information
#
# Table name: purchase_orders
#
#  id         :bigint           not null, primary key
#  po_number  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class PurchaseOrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  fixtures :all
  
  test "Purchase Order attributes must not be empty" do
    po = PurchaseOrder.new

    assert po.invalid?
    assert po.errors[:po_number].any?
  end

end
