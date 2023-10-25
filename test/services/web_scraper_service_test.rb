require 'test_helper'

class WebScraperServiceTest < ActiveSupport::TestCase
  fixtures :users

  test "it should scrape the url and create individual_links objects" do
    user = users(:user)
    scraped_link = ScrapedLink.create(link: 'https://scrapeme.live/shop/Squirtle/', user: user)
    service = WebScraperService.new(scraped_link.id)

    VCR.use_cassette("interacting_scrapeme_squirtle_api") do
      assert_difference("IndividualLink.count", 22) do
        service.run
      end
    end

    assert_equal('Squirtle – ScrapeMe', scraped_link.reload.name)
    assert_equal(individual_links_names, scraped_link.individual_links.pluck(:name))
    assert_equal(individual_links_urls, scraped_link.individual_links.pluck(:url))
  end

  def individual_links_names
    ["ScrapeMe",
      "Home",
      "Home",
      "\n\t\t\t\t£0.00 0 items\n\t\t\t",
      "Home",
      "Tiny Turtle",
      "",
      "Pokemon",
      "Tiny Turtle",
      "squirtle",
      "Tiny Turtle",
      "Torrent",
      "Fearow\n\t£95.00\n",
      "Wartortle\n\t£123.00\n",
      "Butterfree\n\t£162.00\n",
      "Charizard",
      "Blastoise",
      "Log in",
      "Entries RSS",
      "Comments RSS",
      "WordPress.org",
      "Built with Storefront & WooCommerce"]
  end

  def individual_links_urls
    ["https://scrapeme.live/",
    "https://scrapeme.live/",
    "https://scrapeme.live/",
    "https://scrapeme.live",
    "https://scrapeme.live",
    "https://scrapeme.live/product-category/tiny-turtle/",
    "https://scrapeme.live/wp-content/uploads/2018/08/007.png",
    "https://scrapeme.live/product-category/pokemon/",
    "https://scrapeme.live/product-category/tiny-turtle/",
    "https://scrapeme.live/product-tag/squirtle/",
    "https://scrapeme.live/product-tag/tiny-turtle/",
    "https://scrapeme.live/product-tag/torrent/",
    "https://scrapeme.live/shop/Fearow/",
    "https://scrapeme.live/shop/Wartortle/",
    "https://scrapeme.live/shop/Butterfree/",
    "https://scrapeme.live/shop/Charizard/",
    "https://scrapeme.live/shop/Blastoise/",
    "https://scrapeme.live/wp-login.php",
    "https://scrapeme.live/feed/",
    "https://scrapeme.live/comments/feed/",
    "https://wordpress.org/",
    "https://woocommerce.com"]
  end
end