class WebScraperService
  def initialize(scraped_link_id)
    @scraped_link = ScrapedLink.find(scraped_link_id)
  end

  def run
    response = Faraday.get(@scraped_link.link)

    if response.success?
      # Parse the HTML content using Nokogiri
      doc = Nokogiri::HTML(response.body)
      name = doc.at_css('title').text || 'title not found'
      links = []

      doc.css('a').each do |link_tag|
        href = link_tag['href']
        content = link_tag.text

        # some <a> tags seem to have js based href content, this filters for url's only
        links << { href: href, content: content } if href.include?('http')
      end

      links.map { |link| create_individual_link(link) }

      # This should probably go in the worker later, perhaps?
      if @scraped_link.update(total: links.count, name: name, status: 'completed')
        return
      end

      @scraped_link.update(name: name, status: 'error')
    else
      # Handle the case where the GET request is not successful
      @scraped_link.update(name: name, status: 'error')
    end
  end

  def create_individual_link(link)
    IndividualLink.create(scraped_link: @scraped_link, url: link[:href], name: link[:content])
  end
end