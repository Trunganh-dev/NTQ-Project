require 'test_helper'

class AjaxControllerTest < ActionDispatch::IntegrationTest
  test "should get getemail" do
    get ajax_getemail_url
    assert_response :success
  end

end
