require 'test_helper'

class ElectionTrailsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get election_trails_index_url
    assert_response :success
  end

end
