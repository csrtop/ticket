require 'test_helper'

class FinticketControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get finticket_index_url
    assert_response :success
  end

end
