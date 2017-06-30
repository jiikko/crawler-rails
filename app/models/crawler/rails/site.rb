module Crawler::Rails
  class Site < ApplicationRecord
    has_many :page_sources
    has_many :entries
    has_many :crawling_jobs

    def crawl
      crawling_job = crawling_jobs.create!
      crawling_logs =
        entries.map do |e|
          crawling_log = e.scrape_with_logging(crawling_job_id: crawling_job.id)
        end
      unless crawling_logs.all?(&:status_success?)
        crawling_job.update!(success: false)
      end
    end
  end
end
