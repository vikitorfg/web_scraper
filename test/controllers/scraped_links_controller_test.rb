require "test_helper"

class ScrapedLinksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @scraped_link = scraped_links(:one)
  end

  test "should get index" do
    get scraped_links_url
    assert_response :success
  end

  test "should get new" do
    get new_scraped_link_url
    assert_response :success
  end

  test "should create scraped_link" do
    assert_difference("ScrapedLink.count") do
      post scraped_links_url, params: { scraped_link: { link: @scraped_link.link, name: @scraped_link.name, total: @scraped_link.total } }
    end

    assert_redirected_to scraped_link_url(ScrapedLink.last)
  end

  test "should show scraped_link" do
    get scraped_link_url(@scraped_link)
    assert_response :success
  end

  test "should get edit" do
    get edit_scraped_link_url(@scraped_link)
    assert_response :success
  end

  test "should update scraped_link" do
    patch scraped_link_url(@scraped_link), params: { scraped_link: { link: @scraped_link.link, name: @scraped_link.name, total: @scraped_link.total } }
    assert_redirected_to scraped_link_url(@scraped_link)
  end

  test "should destroy scraped_link" do
    assert_difference("ScrapedLink.count", -1) do
      delete scraped_link_url(@scraped_link)
    end

    assert_redirected_to scraped_links_url
  end
end
