# == Schema Information
#
# Table name: checks
#
#  id             :bigint           not null, primary key
#  routing_number :string
#  account_number :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class CheckTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  fixtures :all

  test "Check attributes must not be empty" do 
    c = Check.new
    assert c.invalid?
    assert c.errors[:routing_number].any?
    assert c.errors[:account_number].any?
  end

end
