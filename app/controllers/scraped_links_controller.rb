class ScrapedLinksController < ApplicationController
  before_action :set_scraped_link, only: %i[ show destroy ]

  # GET /scraped_links or /scraped_links.json
  def index
    @scraped_links = ScrapedLink.all.order(created_at: :desc)
  end

  # GET /scraped_links/1 or /scraped_links/1.json
  def show
  end

  # POST /scraped_links or /scraped_links.json
  def create
    @scraped_link = ScrapedLink.new(scraped_link_params)

    if @scraped_link.save
      # TODO - make it a sidekiq per event basis
      web_scraper = WebScraperService.new(@scraped_link.id).run
      if web_scraper[:success]
        redirect_to scraped_links_url, notice: "Scraped link was successfully created."
      else
        render :new, status: :unprocessable_entity 
      end
    else
      render :new, status: :unprocessable_entity 
    end
  end

  # DELETE /scraped_links/1 or /scraped_links/1.json
  def destroy
    @scraped_link.destroy!

    respond_to do |format|
      format.html { redirect_to scraped_links_url, notice: "Scraped link was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scraped_link
      @scraped_link = ScrapedLink.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def scraped_link_params
      params.require(:scraped_link).permit(:link)
    end
end
