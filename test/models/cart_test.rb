# == Schema Information
#
# Table name: carts
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class CartTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  fixtures :all
  
  test "cart should add all items" do 
    c = carts(:one) 
    p = products(:one)
    p2 = products(:two)

    c.add_product(p)
    c.add_product(p2)

    assert_equal c.total_price, 19.98
  end

  test "cart should add product" do 
    c  = carts(:one)
    p  = products(:one)

    assert_equal c.line_items.length, 1
    c.add_product(p)
    assert_equal c.line_items.length, 2
  end

end
