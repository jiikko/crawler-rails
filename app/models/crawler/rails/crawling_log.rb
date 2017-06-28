module Crawler::Rails
  class CrawlingLog < ApplicationRecord
    enum status: [
      :status_ready,
      :status_success,
      :status_error,
      :status_canceled,
    ]

    belongs_to :entry
    belongs_to :crawling_job
  end
end
