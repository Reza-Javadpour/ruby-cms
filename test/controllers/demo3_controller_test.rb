require 'test_helper'

class Demo3ControllerTest < ActionDispatch::IntegrationTest
  test "should get ind" do
    get demo3_ind_url
    assert_response :success
  end

end
