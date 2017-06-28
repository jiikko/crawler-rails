require 'open-uri'
require 'kconv'

module Crawler::Rails
  class Entry < ApplicationRecord
    belongs_to :page_source

    def scrape
      file = open(page_source.url)
      block = eval(scraping_code) # danger!!
      block.call(Nokogiri::HTML(file.read.toutf8, nil, 'utf-8'))
    end
  end
end
