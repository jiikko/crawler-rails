class CreateCrawlerRailsCrawlingJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :crawler_rails_crawling_jobs do |t|
      t.integer :site_id, null: false, index: true

      t.timestamps
    end
  end
end
