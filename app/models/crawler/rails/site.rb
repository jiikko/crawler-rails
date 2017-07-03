module Crawler::Rails
  class Site < ApplicationRecord
    has_many :page_sources
    has_many :entries
    has_many :crawling_jobs

    scope :has_schedule, ->{
      where.not(schedule: [nil, ''])
    }

    def crawl(next_queue: false)
      crawling_job = crawling_jobs.create!
      crawling_logs =
        entries.map do |e|
          crawling_log = e.scrape_with_logging(crawling_job_id: crawling_job.id)
        end
      unless crawling_logs.all?(&:status_success?)
        crawling_job.update!(success: false)
      end
      queue_crawl if next_queue
    end

    # TODO 重複してqueue しないようにする
    def queue_crawl
      next_on = Date.today + 1.day
      run_at = "#{next_on} #{hh_mm_on_schedule}:00"
      delay(run_at: run_at).crawl(next_queue: true)
    end

    def schedule=(value)
      value == 'none' ? super(nil) : super
    end

    def hh_mm_on_schedule
      schedule
    end
  end
end
