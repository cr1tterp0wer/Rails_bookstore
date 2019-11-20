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

class Order < ApplicationRecord

  enum pay_type: {
    "Check" => 0,
    "Credit Card" => 1,
    "Purchase Order" => 2
  }

  validates :name, :address, :email, presence: true
  validates :pay_type, inclusion: {in: pay_types} 
  has_many  :line_items, dependent: :destroy
  belongs_to :payment_detail, polymorphic: true
  accepts_nested_attributes_for :payment_detail, reject_if: :validate_atts_invalid

  def validate_atts_invalid(params)
    reject = false 
    if pay_type == "Credit Card"
      reject = !CreditCard.luhn_validate( params[:credit_card_number] )
      reject = !CreditCard.date_validate( params[:expiration_date] )
    end

    return reject
  end

  def build_payment_detail(params)
    self.payment_detail = payment_detail_type.constantize.new(params)
  end

  def add_line_items_from_cart( cart )
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
end
