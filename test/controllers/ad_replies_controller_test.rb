require 'test_helper'

class AdRepliesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ad_reply = ad_replies(:one)
  end

  test "should get index" do
    get ad_replies_url
    assert_response :success
  end

  test "should get new" do
    get new_ad_reply_url
    assert_response :success
  end

  test "should create ad_reply" do
    assert_difference('AdReply.count') do
      post ad_replies_url, params: { ad_reply: {  } }
    end

    assert_redirected_to ad_reply_url(AdReply.last)
  end

  test "should show ad_reply" do
    get ad_reply_url(@ad_reply)
    assert_response :success
  end

  test "should get edit" do
    get edit_ad_reply_url(@ad_reply)
    assert_response :success
  end

  test "should update ad_reply" do
    patch ad_reply_url(@ad_reply), params: { ad_reply: {  } }
    assert_redirected_to ad_reply_url(@ad_reply)
  end

  test "should destroy ad_reply" do
    assert_difference('AdReply.count', -1) do
      delete ad_reply_url(@ad_reply)
    end

    assert_redirected_to ad_replies_url
  end
end
