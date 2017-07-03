module Crawler::Rails
  class BatchJob < ApplicationRecord
    JOB_LIST = [
      :queue_crawl_schedule,
    ]

    def self.scheduled_crawl_with_delay
      run_at = Date.today.beginning_of_day + 1.day
      # 定期実行を停止する時はdelayed_jobレコードも削除する
      if find_by(name: :scheduled_crawl).nil?
        batch_job = create!(name: :scheduled_crawl)
        batch_job.delay(run_at: run_at, queue: :scheduled_crawl).scheduled_crawl
      end
    end

    def scheduled_crawl
      Crawler::Rails::Site.has_schedule.find_each(&:crawl_to_tomorrow)
      self.destroy
      self.class.scheduled_crawl_with_delay
    end
  end
end
