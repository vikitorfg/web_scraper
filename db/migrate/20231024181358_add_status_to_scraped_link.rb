class AddStatusToScrapedLink < ActiveRecord::Migration[7.1]
  def change
    add_column :scraped_links, :status, :integer
  end
end
