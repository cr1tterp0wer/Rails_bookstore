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

class CreditCard < ApplicationRecord
  validates :credit_card_number, :expiration_date, presence: true
  has_one :order, as: :payment_detail, dependent: :destroy, inverse_of: :order
  
  def self.date_validate(date)
    !!( date =~ /^[0-9]{2}\/[0-9]{2}/)
  end

  def self.luhn_validate(cc_number)
    cc_last    = cc_number[-1]
    cc_reverse = cc_number[0...-1].reverse()
    sum = 0

    cc_reverse.each_char.with_index(1) do |n,i|
      if( ( i % 2) != 0 )
        n = n.to_i * 2
        if( n > 9 )
          n = n - 9
        end
      end
      cc_reverse[i-1] = n.to_s
    end

    cc_reverse.each_char do |n|
      sum = n.to_i + sum
    end

    return ( 10 - (sum % 10) == cc_last.to_i) ? true : false
  end
  
end
