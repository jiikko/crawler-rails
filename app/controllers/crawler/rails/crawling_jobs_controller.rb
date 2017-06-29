module Crawler
  module Rails
    class CrawlingJobsController < ApplicationController
      def index
        @crawling_jobs = CrawlingJob.latests_per_site
      end

      def show
        @crawling_job = CrawlingJob.find(params[:id])
      end
    end
  end
end
