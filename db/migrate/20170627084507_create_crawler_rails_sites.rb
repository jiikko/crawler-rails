class CreateCrawlerRailsSites < ActiveRecord::Migration[5.1]
  def change
    create_table :crawler_rails_sites do |t|
      t.string :name, limit: 191, null: false
      t.string :url, limit: 191, null: false
      t.index :url

      t.timestamps
    end
  end
end
