# == Schema Information
#
# Table name: orders
#
#  id                  :bigint           not null, primary key
#  name                :string
#  address             :text
#  email               :string
#  pay_type            :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  payment_detail_id   :bigint
#  payment_detail_type :string
#

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  fixtures :all

  test "Order attributes must not be empty" do
    o = Order.new
    assert o.invalid?
    assert o.errors[:name].any?
    assert o.errors[:address].any?
    assert o.errors[:email].any?
    assert o.errors[:pay_type].any?
  end

  test "Order Payment type must accept nested attributes" do 
    o = Order.new( name: 'Dave',
                   address: 'lkjlkj',
                   email: 'd@t.com',
                   pay_type: 'Credit Card',
                   payment_detail_type: 'CreditCard',
                   payment_detail_attributes: 
                             { credit_card_number: "123457890",
                               expiration_date: "09/11"}
                 )

    assert_equal true,  o.valid?
    assert o.payment_detail.credit_card_number == "123457890"
  end

end
