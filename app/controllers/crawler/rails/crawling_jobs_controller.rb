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
             [CrawlingJob.latests_per_site, CrawlingJob.latests_per_site]
          when 'day'
            [CrawlingJob.all, CrawlingJob.all]
          else
            [CrawlingJob.all, CrawlingJob.all]
          end
      end

      def show
        @crawling_job = CrawlingJob.find(params[:id])
      end
    end
  end
end
