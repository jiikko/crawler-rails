require 'open-uri'
require 'kconv'

module Crawler::Rails
  class Entry < ApplicationRecord
    belongs_to :page_source

    def scrape
      file = open(page_source.url)
      block = eval(scraping_code) # danger!!
      out = block.call(Nokogiri::HTML(file.read.toutf8, nil, 'utf-8'))
      Rails.logger.info out
      out
    end
  end
end
