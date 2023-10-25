class ScraperJob
  include Sidekiq::Job

  def perform(scraped_link_id)
    WebScraperService.new(scraped_link_id).run
  end
end
