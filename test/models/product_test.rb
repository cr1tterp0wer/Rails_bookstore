# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  image_url   :string
#  price       :decimal(8, 2)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  fixtures :products

  def new_product( img_url )
    Product.new( title: "Sample Title",
                 description: "yyy",
                 price: 1,
                 image_url: img_url )
  end

  test "product attirbutes must not be empty" do
    p = Product.new
    assert p.invalid?
    assert p.errors[:title].any?
    assert p.errors[:description].any?
    assert p.errors[:price].any?
    assert p.errors[:image_url].any?
  end

  test "product price must be positive" do
    p = Product.new( title: "Sample Title",
                           description: "yyy",
                           image_url: "url.png")
    p.price = -1
    assert p.invalid?
    assert_equal ["must be greater than or equal to 0.01"], p.errors[:price] 

    p.price = 0
    assert p.invalid?
    assert_equal ["must be greater than or equal to 0.01"], p.errors[:price]

    p.price = 1
    assert p.valid?
  end

  test "image url" do
    ok  = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg http://a.b.c/z/y/z/fred.gif }
    bad = %w{ fred.doc fred.gif/more fred.gif.more }
    
    ok.each do |image_url|
      assert new_product( image_url ).valid?, "#{ image_url } souldn't be invalid"
    end
    
    bad.each do |image_url|
      assert new_product( image_url ).invalid?, "#{ image_url } should be invalid"
    end
  end

  test "Product is not valid without a unique title" do

    product = Product.new(
                      title: products( :ruby ).title,
                      description: "yyy",
                      price: 1,
                      image_url: "ruby.jpg" )
    assert product.invalid?
    assert_equal ["has already been taken"], product.errors[:title]
  end

end
