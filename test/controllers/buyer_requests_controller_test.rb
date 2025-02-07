require "test_helper"

class BuyerRequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get buyer_requests_index_url
    assert_response :success
  end
end
