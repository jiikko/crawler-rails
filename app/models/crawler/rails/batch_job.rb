module Crawler::Rails
  class BatchJob < ApplicationRecord
    JOB_LIST = [
      :queue_crawl_schedule,
    ]

    class << self
      def queue_crawl_schedule
        Crawler::Rails::Site.has_schedule.find_each(&:queue_crawl)
      end
    end
  end
end
