module Crawler::Rails
  class Site < ApplicationRecord
    has_many :page_sources
    has_many :entries
    has_many :crawling_jobs

    def crawl
      crawling_job = crawling_jobs.create!
      entries.each { |e| e.scrape_with_logging(crawling_job_id: crawling_job.id) }
    end
  end
end
