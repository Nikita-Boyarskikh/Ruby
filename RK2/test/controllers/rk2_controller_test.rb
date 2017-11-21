require 'test_helper'

class Rk2ControllerTest < ActionDispatch::IntegrationTest
  test 'should get input' do
    get rk2_input_url
    assert_response :success
  end

  test 'should get result' do
    get rk2_result_url
    assert_response :success
  end

  test 'simple' do
    get rk2_result_url, params: {array: %q(1 2 3 4 5 6 7 8 9)}
    assert_equal [1, 2, 3, 4, 5, 6, 7, 0, 9], assigns[:result]
    assert_nil assigns[:error]
  end
end
