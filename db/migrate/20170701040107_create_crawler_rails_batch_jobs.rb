class CreateCrawlerRailsBatchJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :crawler_rails_batch_jobs do |t|
      t.string :name

      t.timestamps
    end
  end
end
