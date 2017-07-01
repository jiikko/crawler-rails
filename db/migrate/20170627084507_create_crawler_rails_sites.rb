class CreateCrawlerRailsSites < ActiveRecord::Migration[5.1]
  def change
    create_table :crawler_rails_sites do |t|
      t.string :name, limit: 191, null: false
      t.string :schedule

      t.timestamps
    end
  end
end
