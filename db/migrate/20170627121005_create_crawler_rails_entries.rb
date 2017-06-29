class CreateCrawlerRailsEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :crawler_rails_entries do |t|
      t.string :name, null: false
      t.boolean :enable, null: false, default: true
      t.integer :site_id, index: true
      t.integer :page_source_id, null: false
      t.text :scraping_code

      t.timestamps
    end
  end
end
