class WebScraperService
  def initialize(scraped_link_id)
    @scraped_link = ScrapedLink.find(scraped_link_id)
  end

  def run
    # scraped_links = ScrapedLink.find(@reference)
    response = Faraday.get(@scraped_link.link)

    if response.success?
      # Parse the HTML content using Nokogiri
      doc = Nokogiri::HTML(response.body)
      links = []

      doc.css('a').each do |link_tag|
        href = link_tag['href']
        content = link_tag.text

        links << { href: href, content: content }
      end

      # This should probably go in the worker later, perhaps?
      if @scraped_link.update(total: links.count)
        return { success: true, model: @scraped_link }
      end

      return { success: false, errors: @scraped_link.errors.messages }
    else
      # Handle the case where the GET request is not successful
      return { success: false, errors: response.errors }
    end
  end
end