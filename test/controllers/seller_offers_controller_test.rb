require "test_helper"

class SellerOffersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get seller_offers_index_url
    assert_response :success
  end
end
