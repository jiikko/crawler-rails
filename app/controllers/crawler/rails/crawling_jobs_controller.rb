module Crawler
  module Rails
    class CrawlingJobsController < ApplicationController
      def show
        @crawling_job = CrawlingJob.find(params[:id])
      end
    end
  end
end
