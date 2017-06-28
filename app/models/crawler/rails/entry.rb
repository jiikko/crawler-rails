require 'open-uri'
require 'kconv'

module Crawler::Rails
  class Entry < ApplicationRecord
    belongs_to :page_source

    SCRAPING_TIMEOUT = 10

    def scrape
      Timeout.timeout(SCRAPING_TIMEOUT) do
        file = open(page_source.url)
        block = eval(scraping_code) # danger!!
        out = block.call(Nokogiri::HTML(file.read.toutf8, nil, 'utf-8'))
        Rails.logger.info out
        out
      end
    rescue Timeout::Error
      "タイムアウト(#{SCRAPING_TIMEOUT}秒)になりました.処理は中断されました。"
    rescue => e
      e.inspect
    end
  end
end
