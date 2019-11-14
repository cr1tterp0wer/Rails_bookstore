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
end
