class CreateIndividualLinks < ActiveRecord::Migration[7.1]
  def change
    create_table :individual_links do |t|
      t.string :name
      t.string :url
      t.references :scraped_link, null: false, foreign_key: true

      t.timestamps
    end
  end
end
