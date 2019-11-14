# == Schema Information
#
# Table name: credit_cards
#
#  id                 :bigint           not null, primary key
#  credit_card_number :string
#  expiration_date    :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'test_helper'

class CreditCardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  fixtures :all

  test "Credit Card attributes must not be empty" do
    c = CreditCard.new
    assert c.invalid?
    assert c.errors[:expiration_date].any?
    assert c.errors[:credit_card_number].any?
  end

  test "Credit Card date must be mm/yy format" do
    c = CreditCard.new( credit_card_number: 123,
                        expiration_date: "10/22")
    assert c.valid?
    assert_equal true, !!( c.expiration_date =~ /^[0-9]{2}\/[0-9]{2}/)
    c.expiration_date = "Sept. 20, 2019"
    assert_equal false, !!(c.expiration_date =~ /^[0-9]{2}\/[0-9]{2}/)
  end

end
