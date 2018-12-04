require 'test_helper'

class DebtorTest < ActiveSupport::TestCase
  include Devise::Test::IntegrationHelpers
  test "should not save debtor without name" do
    sign_in users(:user_one)
    debtor = Debtor.new()
    assert_not debtor.save
  end
end
