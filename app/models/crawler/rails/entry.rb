require 'open-uri'
require 'kconv'

module Crawler::Rails
  class Entry < ApplicationRecord

    SCRAPING_TIMEOUT = 10

    belongs_to :page_source

    has_many :crawling_logs

    def scrape_with_logging(crawling_job_id: )
      crawling_log = crawling_logs.create!(crawling_job_id: crawling_job_id)
      result = scrape
      case result[:status]
      when :success
        crawling_log.status_success!
        crawling_log.update!(out: result[:message])
      when :error
        crawling_log.status_error!
        crawling_log.update!(error_trace: result[:message])
      else
        raise('unknown status')
      end
    rescue => e
      crawling_log.status_error!
      crawling_log.update!(error_trace: e.inspect)
    end

    def scrape
      Timeout.timeout(SCRAPING_TIMEOUT) do
        file = open(page_source.url)
        block = eval(scraping_code) # danger!!
        out = block.call(Nokogiri::HTML(file.read.toutf8, nil, 'utf-8'))
        Rails.logger.info out
        { status: :success, message: out }
      end
    rescue Timeout::Error
      { status: :error, message: "タイムアウト(#{SCRAPING_TIMEOUT}秒)になりました.処理は中断されました。" }
    rescue => e
      { status: :error, message: e.inspect }
    end
  end
end
