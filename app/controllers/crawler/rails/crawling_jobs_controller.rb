module Crawler
  module Rails
    class CrawlingJobsController < ApplicationController
      def index
        if params[:view_type].nil?
          redirect_to(crawling_jobs_path(view_type: 'latests_per_site'))
          return
        end

        @failure_crawling_jobs, @success_crawling_jobs =
          case params[:view_type]
          when 'latests_per_site'
            @h2_text = 'サイト毎最新のクロール'
            [CrawlingJob.latests_per_site.failure, CrawlingJob.latests_per_site.success]
          when 'day'
            @h2_text = '日付でクロール'
            [CrawlingJob.failure, CrawlingJob.success]
          else
            [CrawlingJob.failure, CrawlingJob.success]
          end
      end

      def show
        @crawling_job = CrawlingJob.find(params[:id])
      end
    end
  end
end
