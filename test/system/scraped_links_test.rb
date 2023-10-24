require "application_system_test_case"

class ScrapedLinksTest < ApplicationSystemTestCase
  setup do
    @scraped_link = scraped_links(:one)
  end

  test "visiting the index" do
    visit scraped_links_url
    assert_selector "h1", text: "Scraped links"
  end

  test "should create scraped link" do
    visit scraped_links_url
    click_on "New scraped link"

    fill_in "Link", with: @scraped_link.link
    fill_in "Name", with: @scraped_link.name
    fill_in "Total", with: @scraped_link.total
    click_on "Create Scraped link"

    assert_text "Scraped link was successfully created"
    click_on "Back"
  end

  test "should update Scraped link" do
    visit scraped_link_url(@scraped_link)
    click_on "Edit this scraped link", match: :first

    fill_in "Link", with: @scraped_link.link
    fill_in "Name", with: @scraped_link.name
    fill_in "Total", with: @scraped_link.total
    click_on "Update Scraped link"

    assert_text "Scraped link was successfully updated"
    click_on "Back"
  end

  test "should destroy Scraped link" do
    visit scraped_link_url(@scraped_link)
    click_on "Destroy this scraped link", match: :first

    assert_text "Scraped link was successfully destroyed"
  end
end
