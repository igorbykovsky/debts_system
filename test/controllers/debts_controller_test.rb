require 'test_helper'

class DebtsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get debts_index_url
    assert_response :success
  end

  test "should get new" do
    get debts_new_url
    assert_response :success
  end

  test "should get show" do
    get debts_show_url
    assert_response :success
  end

end
