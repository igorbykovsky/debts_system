require 'test_helper'

class DebtorsFlowTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  test "can see debtors page" do
    sign_in users(:user_one)
    get "/"
    assert_select "h1", "All debtors of #{users(:user_one).email}"
    sign_out :user
    get "/"
    assert_select "h1", "Hello, guest"
  end
end
