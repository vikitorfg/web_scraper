require "test_helper"

class ScrapedLinksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @scraped_link = scraped_links(:one)
    @user = users(:user)
    sign_in_user
  end

  test "should get index" do
    get scraped_links_url
    assert_response :success
  end

  test "should create scraped_link" do
    VCR.use_cassette("interacting_scrapeme_api") do
      assert_difference("ScrapedLink.count", 1) do
        post scraped_links_url, params: { scraped_link: { link: 'https://scrapeme.live/shop/' } }
      end

      assert_redirected_to scraped_links_url
    end
  end

  test "should show scraped_link" do
    get scraped_link_url(@scraped_link)
    assert_response :success
  end

  test "should destroy scraped_link" do
    assert_difference("ScrapedLink.count", -1) do
      delete scraped_link_url(@scraped_link)
    end

    assert_redirected_to scraped_links_url
  end

  def sign_in_user
    post user_session_path, params: { user: { email: @user.email, password: 'password' } }
  end
end
