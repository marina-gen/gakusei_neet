require 'test_helper'

class MainDiariesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get main_diaries_create_url
    assert_response :success
  end

end
