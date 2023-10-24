class CreateScrapedLinks < ActiveRecord::Migration[7.1]
  def change
    create_table :scraped_links do |t|
      t.string :name
      t.string :link
      t.integer :total

      t.timestamps
    end
  end
end
