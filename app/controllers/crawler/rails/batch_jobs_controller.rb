module Crawler
  module Rails
    class BatchJobsController < ApplicationController
      def queue_crawl_to_all_sites
        BatchJob.schedule_crawl_with_delay
        redirect_to batch_jobs_path, notice: 'すべてのサイトをキューしました'
      end
    end
  end
end
