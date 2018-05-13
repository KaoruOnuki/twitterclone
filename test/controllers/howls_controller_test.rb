require 'test_helper'

class HowlsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get howls_index_url
    assert_response :success
  end

end
