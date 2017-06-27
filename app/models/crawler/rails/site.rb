module Crawler::Rails
  class Site < ApplicationRecord
    has_many :page_sources
  end
end
