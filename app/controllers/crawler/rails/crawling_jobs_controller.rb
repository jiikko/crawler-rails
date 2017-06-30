module Crawler
  module Rails
    class CrawlingJobsController < ApplicationController
      helper_method :view_type_time_series, :view_type_latests_per_site

      def index
        if params[:view_type].nil?
          redirect_to(crawling_jobs_path(view_type: view_type_latests_per_site))
          return
        end
        params[:start_on] ||= Date.today
        params[:end_on] ||= Date.today + 1.day

        @failure_crawling_jobs, @success_crawling_jobs =
          case params[:view_type]
          when view_type_latests_per_site
            @h2_text = 'サイト毎最新のクロール'
            [CrawlingJob.latests_per_site.failure, CrawlingJob.latests_per_site.success]
          when view_type_time_series
            @h2_text = '日付でクロール'
            [ CrawlingJob.failure.where!(created_at: params[:start_on]..params[:end_on]).order(id: :desc),
              CrawlingJob.success.where!(created_at: params[:start_on]..params[:end_on]).order(id: :desc)
            ]
          else
            raise('not found view_type')
          end
      end

      def show
        @crawling_job = CrawlingJob.find(params[:id])
      end

      def view_type_latests_per_site
        'latests_per_site'
      end

      def view_type_time_series
        'time_series'
      end
    end
  end
end
