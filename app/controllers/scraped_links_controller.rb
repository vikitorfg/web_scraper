class ScrapedLinksController < ApplicationController
  before_action :set_scraped_link, only: %i[ show edit update destroy ]

  # GET /scraped_links or /scraped_links.json
  def index
    @scraped_links = ScrapedLink.all
  end

  # GET /scraped_links/1 or /scraped_links/1.json
  def show
  end

  # GET /scraped_links/new
  def new
    @scraped_link = ScrapedLink.new
  end

  # GET /scraped_links/1/edit
  def edit
  end

  # POST /scraped_links or /scraped_links.json
  def create
    @scraped_link = ScrapedLink.new(scraped_link_params)

    respond_to do |format|
      if @scraped_link.save
        format.html { redirect_to scraped_link_url(@scraped_link), notice: "Scraped link was successfully created." }
        format.json { render :show, status: :created, location: @scraped_link }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @scraped_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scraped_links/1 or /scraped_links/1.json
  def update
    respond_to do |format|
      if @scraped_link.update(scraped_link_params)
        format.html { redirect_to scraped_link_url(@scraped_link), notice: "Scraped link was successfully updated." }
        format.json { render :show, status: :ok, location: @scraped_link }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @scraped_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scraped_links/1 or /scraped_links/1.json
  def destroy
    @scraped_link.destroy!

    respond_to do |format|
      format.html { redirect_to scraped_links_url, notice: "Scraped link was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scraped_link
      @scraped_link = ScrapedLink.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def scraped_link_params
      params.require(:scraped_link).permit(:name, :link, :total)
    end
end
