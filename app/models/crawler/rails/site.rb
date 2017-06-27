module Crawler::Rails
  class Site < ApplicationRecord
    has_many :page_sources
    has_many :entries
  end
end
