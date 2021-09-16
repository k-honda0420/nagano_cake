require 'test_helper'

class Public::OrderDetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_order_details_new_url
    assert_response :success
  end

end
