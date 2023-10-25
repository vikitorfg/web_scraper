class AddUserReferenceToScrapedLink < ActiveRecord::Migration[7.1]
  def change
    add_reference :scraped_links, :user, foreign_key: true
  end
end
