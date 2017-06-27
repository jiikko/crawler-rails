class CreateCrawlerRailsPageSources < ActiveRecord::Migration[5.1]
  def change
    create_table :crawler_rails_page_sources do |t|
      t.string :url, limit: 191, null: false
      t.integer :site_id, null: false
      t.index [:site_id, :url], unique: true

      t.timestamps
    end
  end
end
