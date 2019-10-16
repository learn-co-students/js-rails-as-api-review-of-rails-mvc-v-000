require 'test_helper'

class BirdsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get birds_index_url
    assert_response :success
  end

end
