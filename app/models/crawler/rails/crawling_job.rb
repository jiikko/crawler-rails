module Crawler::Rails
  class CrawlingJob < ApplicationRecord
    belongs_to :site

    has_many :crawling_logs
  end
end
