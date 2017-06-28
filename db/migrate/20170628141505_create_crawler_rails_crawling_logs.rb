class CreateCrawlerRailsCrawlingLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :crawler_rails_crawling_logs do |t|
      t.integer :crawling_job_id
      t.integer :entry_id
      t.integer :status, default: 0, null: false
      t.text :out
      t.text :error_trace
      t.index [:crawling_job_id, :entry_id], name: :index_crawling_logs_crawling_job_id_entry_id

      t.timestamps
    end
  end
end
